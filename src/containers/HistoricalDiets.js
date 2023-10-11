import {Button,Grid,IconButton} from "@mui/material";
import Typography from "@mui/material/Typography";
import AddIcon from "@mui/icons-material/Add";
import {DataGrid} from "@mui/x-data-grid";
import React,{useEffect,useState} from "react";
import dayjs from "dayjs"
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import {useGetAllDietTypes,useGetDiet} from "../services/interface";
import {addDoc,collection,deleteDoc,doc,getDoc,getDocs,updateDoc} from "firebase/firestore";
import {auth,db} from "../firebase";
import {useAuthState} from "react-firebase-hooks/auth";
import {useSnackbar} from "notistack";
import {HtmlTooltip} from "./Users";
import VisibilityIcon from '@mui/icons-material/Visibility';
import {makeStyles} from "@mui/styles";
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

export default function HistoricalDiets({onGoBack, patient, fetchPatients}) {

    const classes = useStyles();
    const [user, loading, error] = useAuthState(auth);
    const diet = useGetDiet(patient)
    const {enqueueSnackbar} = useSnackbar();
    const dietTypes = useGetAllDietTypes()
    const [historicalDiets, setHistoricalDiets] = useState([])
    const [showingDiet, setShowingDiet] = useState(false)

    useEffect(() => {
        fetchHistoricalDiets()
    }, [])

    const fetchHistoricalDiets = async () => {
        await getDocs(collection(db, `diets-${patient.id}`))
            .then((querySnapshot)=>{
                const newData = querySnapshot.docs.map((doc) => {
                    return {
                        id: doc.id,
                        ...doc.data()
                    }
                });
                setHistoricalDiets(newData);
            })
    }

    const onDelete = (dietId) => {
        enqueueSnackbar("Deleting...", {variant: "info"});
        deleteDoc(doc(db, `diets-${patient.id}`, dietId))
            .then(() => {
                fetchHistoricalDiets().then(() =>
                    enqueueSnackbar("Deleted", {variant: "success"})
                )
            })
            .catch(e => enqueueSnackbar(e, {variant: "error"}))
    }

    const columns = [
        { field: 'date', headerName: 'Date', flex: 2, renderCell: (params) => dayjs(params.value).format('DD/MM/YYYY - HH:mm') },
        { field: 'weight', headerName: 'Weight', flex: 2, renderCell: (params) => `${params.value} kg` },
        { field: 'height', headerName: 'Height', flex: 2, renderCell: (params) => `${params.value} cm` },
        { field: 'bmi', headerName: 'BMI', flex: 2, renderCell: (params) => params.value?.toFixed(2) },
        { field: 'energyDemand', headerName: 'Energy Demand', flex: 2, renderCell: (params) => `${params.value} kcal` },
        {
            field : "suggestedDiets",
            headerName : "Diet types",
            flex : 3,
            renderCell : (params) => {
                const types = params.value?  dietTypes?.filter(dt => params.value.includes(dt.id))?.map(dt => dt.value)?.join(", ") : ""
                return<Grid container direction="row" alignItems="center" justifyContent="space-between" wrap="nowrap">
                    <HtmlTooltip title={types}>
                        <Grid item xs={12}>
                            <Typography noWrap component="div" variant="div">{types}</Typography>
                        </Grid>
                    </HtmlTooltip>
                </Grid>
            }
        },
        {
            field : 'actions',
            type : 'actions',
            width : 110,
            renderCell : (params) => <Grid container direction={"row"} justifyContent="flex-end">
                <Grid item>
                    <IconButton onClick={() => setShowingDiet(params.row.id)}>
                        <VisibilityIcon fontSize="medium"/>
                    </IconButton>
                </Grid>
                <Grid item>
                    <ConfirmDeleteIconButton
                        title={`Delete?`} onDelete={() => onDelete(params.row.id)}
                        description="Are you sure you want to delete the diet?"
                    />
                </Grid>
            </Grid>
        }
    ]

    const saveComputedDiet = () => {
        const newDiet = {
            date: Date.now(),
            weight: patient.weight,
            height: patient.height,
            bmi: patient.bmi,
            energyDemand: patient.energyDemand,
            suggestedDiets: patient.suggestedDiets,
            diet: diet
        }
        try {
            enqueueSnackbar("Saving...", {variant: "info"});
            addDoc(collection(db, `diets-${patient.id}`), {...newDiet})
                .then(() => {
                    fetchHistoricalDiets().then(() =>
                        enqueueSnackbar("Saved", {variant: "success"})
                    )
                })
        } catch (e) {
            enqueueSnackbar(e, {variant: "error"})
        }
    }

    return <div style={{ height: '80%', width: '100%' }}>
        <Grid container direction="row" justifyContent="space-between" alignItems="center" sx={{padding: "1rem"}}>
            <Grid item>
                <Button variant="outlined" fullWidth startIcon={<ArrowBackIcon/>} onClick={onGoBack}>
                    Go back
                </Button>
            </Grid>
            <Grid item>
                <Typography component="h2" variant="h5">
                    Historical data for <b>{patient.name} {patient.surname}</b>
                </Typography>
            </Grid>
            <Grid item>
                <Button variant="outlined" fullWidth startIcon={<AddIcon/>} onClick={saveComputedDiet}>
                    Compute New Diet
                </Button>
            </Grid>
        </Grid>
        <DataGrid
            className={classes.table}
            rows={historicalDiets || []}
            columns={columns}
        />
    </div>
}