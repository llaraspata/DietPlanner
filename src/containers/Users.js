import { DataGrid } from '@mui/x-data-grid';
import {Button,Grid} from "@mui/material";
import Typography from "@mui/material/Typography";
import React,{useEffect, useState} from 'react';
import AddIcon from "@mui/icons-material/Add";
import PatientModal from "../components/PatientModal";
import {collection,addDoc,getDocs} from "firebase/firestore";
import {auth,db} from '../firebase';
import {useAuthState} from "react-firebase-hooks/auth";
import {makeStyles} from "@mui/styles";

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
    const [modalOpen, setModalOpen] = useState(false);
    const [patients, setPatients] = useState([])
    const [user, loading, error] = useAuthState(auth);

    const columns = [
        { field: 'name', headerName: 'Name', flex: 2 },
        { field: 'surname', headerName: 'Surname', flex: 2 },
        { field: 'bmi', headerName: 'BMI', flex: 2, renderCell: (params) => params.value?.toFixed(2) },
        { field: 'energyDemand', headerName: 'Energy Demand (kcal)', flex: 2},
        { field: 'actions', headerName: '', flex: 1} //modifica, cancella e mostra dieta
    ]

    useEffect(() => {
        fetchPatients()
    }, [])

    const onSave = async (patient, patientActivities) => {
        console.log("SAVING")
        try {
            await addDoc(collection(db, `patients-${user.uid}`), {
                patient: patient,
                patientActivities: patientActivities
            });
            setModalOpen(false)
            await fetchPatients()
        } catch (e) {
            console.error("Error adding document: ", e);
        }
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