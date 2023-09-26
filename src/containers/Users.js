import { DataGrid } from '@mui/x-data-grid';
import {Button,Grid,IconButton} from "@mui/material";
import Typography from "@mui/material/Typography";
import React,{useEffect, useState} from 'react';
import PatientModal from "../components/modals/PatientModal";
import {collection,addDoc,getDocs,doc,deleteDoc,updateDoc} from "firebase/firestore";
import {auth,db} from '../firebase';
import {useAuthState} from "react-firebase-hooks/auth";
import {makeStyles} from "@mui/styles";
import {useSnackbar} from "notistack";
import ConfirmDeleteIconButton from "../components/ConfirmDeleteIconButton";

import AddIcon from "@mui/icons-material/Add";
import CalendarMonthIcon from '@mui/icons-material/CalendarMonth';
import EditIcon from '@mui/icons-material/Edit';
import AccountTreeIcon from '@mui/icons-material/AccountTree';
import RestartAltIcon from '@mui/icons-material/RestartAlt';
import QuestionnaireModal from "../components/modals/QuestionnaireModal";

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
    const [editCreateUserModal, setEditCreateUserModal] = useState(false);
    const [questionnaireModal, setQuestionnaireModal] = useState(false);

    const [patients, setPatients] = useState([])
    const [user, loading, error] = useAuthState(auth);

    const columns = [
        { field: 'name', headerName: 'Name', flex: 2 },
        { field: 'surname', headerName: 'Surname', flex: 2 },
        { field: 'bmi', headerName: 'BMI', flex: 2, renderCell: (params) => params.value?.toFixed(2) },
        { field: 'energyDemand', headerName: 'Energy Demand (kcal)', flex: 2},
        {
            field: "type",
            headerName: "Diet type",
            flex: 4,
            renderCell: (params) => {
                return <Grid container justifyContent="space-between">
                    <Grid item>
                        {params.value}
                    </Grid>
                    <Grid item>
                        <Button variant="outlined" fullWidth
                                startIcon={params.value ? <RestartAltIcon/> : <AccountTreeIcon/>}
                                onClick={() => setQuestionnaireModal(true)}>
                            {params.value ? "Re-copmute type" : "Generate type"}
                        </Button>
                    </Grid>
                </Grid>
            }
        },
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
                    <IconButton onClick={() => setEditCreateUserModal(params.row)}>
                        <EditIcon fontSize="medium"/>
                    </IconButton>
                </Grid>
                <Grid item>
                    <ConfirmDeleteIconButton
                        title={`Delete ${params.row.name} ${params.row.surname}?`} onDelete={() => onDelete(params.row.id)}
                        description="Are you sure you want to delete the patient?"
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
        if(patient.id) {
            //save existing patient
            let pid = patient.id
            delete patient.id
            updateDoc(doc(db, `patients-${user.uid}`, pid), {
                patient: patient,
                patientActivities: patientActivities
            }).then(() => {
                setEditCreateUserModal(false)
                fetchPatients()
                enqueueSnackbar("Saved", {variant: "success"})
            }).catch((e) => enqueueSnackbar(e, {variant: "error"}))
        } else {
            //save new patient
            try {
                await addDoc(collection(db, `patients-${user.uid}`), {
                    patient: patient,
                    patientActivities: patientActivities
                });
                setEditCreateUserModal(false)
                await fetchPatients()
                enqueueSnackbar("Saved", {variant: "success"})
            } catch (e) {
                enqueueSnackbar(e, {variant: "error"})
            }
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

    return <div style={{ height: '80%', width: '100%' }}>
        <Grid container direction="row" justifyContent="space-between" alignItems="center" sx={{padding: "1rem"}}>
            <Grid item>
                <Typography component="h2" variant="h5">
                    PATIENTS
                </Typography>
            </Grid>
            <Grid item>
                <Button variant="outlined" fullWidth startIcon={<AddIcon/>} onClick={() => setEditCreateUserModal({})}>
                    Add Patient
                </Button>
            </Grid>
        </Grid>
        <DataGrid
            className={classes.table}
            rows={patients}
            columns={columns}
        />
        <PatientModal open={!!editCreateUserModal} onClose={() => setEditCreateUserModal(false)}
                      onSave={onSave} defaultPatient={editCreateUserModal}/>
        <QuestionnaireModal open={!!questionnaireModal} onClose={() => setQuestionnaireModal(false)}
                            onSave={() => setQuestionnaireModal(false)}/>
    </div>
}