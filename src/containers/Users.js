import { DataGrid } from '@mui/x-data-grid';
import {Button,Grid,IconButton} from "@mui/material";
import Typography from "@mui/material/Typography";
import React,{useEffect, useState} from 'react';
import AddIcon from "@mui/icons-material/Add";
import PatientModal from "../components/PatientModal";
import {collection,addDoc,getDocs,doc, deleteDoc} from "firebase/firestore";
import {auth,db} from '../firebase';
import {useAuthState} from "react-firebase-hooks/auth";
import {makeStyles} from "@mui/styles";
import {useSnackbar} from "notistack";
import CalendarMonthIcon from '@mui/icons-material/CalendarMonth';
import EditIcon from '@mui/icons-material/Edit';
import ConfirmDeleteIconButton from "../components/ConfirmDeleteIconButton";

const useStyles = makeStyles((theme) => ({
    table: {
        '& .MuiDataGrid-columnHeader': {
            backgroundColor: theme.palette.primary.main,
            color: "white",
            fontSize: "1rem",
            fontWeight: 'bold'
        }
    }
}))

export default function Users(){

    const classes = useStyles();
    const {enqueueSnackbar} = useSnackbar();
    const [modalOpen, setModalOpen] = useState(false);
    const [patients, setPatients] = useState([])
    const [user, loading, error] = useAuthState(auth);

    const columns = [
        { field: 'name', headerName: 'Name', flex: 2 },
        { field: 'surname', headerName: 'Surname', flex: 2 },
        { field: 'bmi', headerName: 'BMI', flex: 2, renderCell: (params) => params.value?.toFixed(2) },
        { field: 'energyDemand', headerName: 'Energy Demand (kcal)', flex: 2},
        {
            field: 'Actions',
            type: 'actions',
            width: 150,
            renderCell: (params) => <Grid container direction={"row"} justifyContent="flex-end">
                <Grid item>
                    <IconButton>
                        <CalendarMonthIcon fontSize="medium"/>
                    </IconButton>
                </Grid>
                <Grid item>
                    <IconButton>
                        <EditIcon fontSize="medium"/>
                    </IconButton>
                </Grid>
                <Grid item>
                    <ConfirmDeleteIconButton
                        title="Delete patient?" onDelete={() => onDelete(params.row.id)}
                        description={`Are you sure you want to delete the patient ${params.row.name} ${params.row.surname}`}
                    />
                </Grid>
            </Grid>
        }
    ]

    useEffect(() => {
        fetchPatients()
    }, [])

    const onSave = async (patient, patientActivities) => {
        enqueueSnackbar("Saving...", {variant: "info"});
        try {
            await addDoc(collection(db, `patients-${user.uid}`), {
                patient: patient,
                patientActivities: patientActivities
            });
            setModalOpen(false)
            await fetchPatients()
            enqueueSnackbar("Saved", {variant: "success"})
        } catch (e) {
            enqueueSnackbar(e, {variant: "error"})
        }
    }

    const onDelete = async (pid) => {
        enqueueSnackbar("Deleting...", {variant: "info"});
        deleteDoc(doc(db, `patients-${user.uid}`, pid))
            .then(() => {
                fetchPatients()
                enqueueSnackbar("Deleted",{variant : "success"})
            })
            .catch(e => enqueueSnackbar(e, {variant: "error"}))
    }

    const fetchPatients = async () => {
        await getDocs(collection(db, `patients-${user.uid}`))
            .then((querySnapshot)=>{
                const newData = querySnapshot.docs.map((doc) => {
                    return {
                        id: doc.id,
                        activities: doc.data().patientActivities,
                        ...doc.data().patient
                    }
                });
                setPatients(newData);
            })
    }

    return <div style={{ height: '85%', width: '100%' }}>
        <Grid container direction="row" justifyContent="space-between" alignItems="center" sx={{padding: "1rem"}}>
            <Grid item>
                <Typography component="h2" variant="h5">
                    PATIENTS
                </Typography>
            </Grid>
            <Grid item>
                <Button variant="outlined" fullWidth startIcon={<AddIcon/>} onClick={() => setModalOpen(true)}>
                    Add Patient
                </Button>
            </Grid>
        </Grid>
        <DataGrid
            className={classes.table}
            rows={patients}
            columns={columns}
        />
        <PatientModal open={modalOpen} onClose={() => setModalOpen(false)} onSave={onSave}/>
    </div>
}