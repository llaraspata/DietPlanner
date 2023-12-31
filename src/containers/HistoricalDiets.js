import {Button,CircularProgress,Grid,IconButton,Tooltip} from "@mui/material";
import Typography from "@mui/material/Typography";
import AddIcon from "@mui/icons-material/Add";
import {DataGrid} from "@mui/x-data-grid";
import React,{useEffect,useState} from "react";
import dayjs from "dayjs"
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import {useGetAllDietTypes,useGetDiet} from "../services/interface";
import {addDoc,collection,deleteDoc,doc,getDocs} from "firebase/firestore";
import {auth,db} from "../firebase";
import {useAuthState} from "react-firebase-hooks/auth";
import {useSnackbar} from "notistack";
import {HtmlTooltip} from "./Users";
import VisibilityIcon from '@mui/icons-material/Visibility';
import {makeStyles} from "@mui/styles";
import ConfirmDeleteIconButton from "../components/ConfirmDeleteIconButton";
import DietInfo from "./DietInfo";
import AutorenewIcon from '@mui/icons-material/Autorenew';

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

/**Component that shows the patient the history in tabular view of the diets generated over time.
 For each diet, an overview is available which shows the date on which it was processed, the patient's weight, height,
 BMI, energy demand and type of inferred diet at that time.
 Furthermore, for each diet it is possible to delete and view it in detail.
 At the top right there is a button to start processing the new diet. Once clicked, processing starts with tau-prolog
 using the useGetDiet() function. Once the processing has been completed, with the same button it is possible
 to add the diet to the history.**/
export default function HistoricalDiets({onGoBack, patient}) {

    const classes = useStyles();
    const [user, loading, error] = useAuthState(auth);
    const [toComputeDietPatient, setToComputeDietPatient] = useState(null)
    const diet = useGetDiet(toComputeDietPatient)
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
        { field: 'weight', headerName: 'Weight', flex: 1, renderCell: (params) => `${params.value} kg` },
        { field: 'height', headerName: 'Height', flex: 1, renderCell: (params) => `${params.value} cm` },
        { field: 'bmi', headerName: 'BMI', flex: 1, renderCell: (params) => params.value?.toFixed(2) },
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

    if(showingDiet) return <DietInfo
        dietData={historicalDiets.find(hd => hd.id === showingDiet)} patient={patient}
        onGoBack={() => setShowingDiet(false)}
    />

    return <div style={{ height: '80%', width: '100%' }}>
        <Grid container direction="row" justifyContent="space-between" alignItems="center" sx={{padding: "1rem"}}>
            <Grid item>
                <Button variant="outlined" fullWidth startIcon={<ArrowBackIcon/>} onClick={onGoBack}>
                    Go back
                </Button>
            </Grid>
            <Grid item>
                <Typography component="h2" variant="h5">
                    Historical data for <b>{patient?.name} {patient?.surname}</b>
                </Typography>
            </Grid>
            <Grid item>
                <Tooltip title={diet.length < 7 && toComputeDietPatient && "Computing new diet, please wait..."}>
                   <span>
                       <Button variant="outlined" fullWidth
                               disabled={toComputeDietPatient && diet.length < 7}
                               startIcon={diet.length < 7 ?
                                   toComputeDietPatient ? <CircularProgress size="22px" sx={{color: "#a6a6a6"}}/> : <AutorenewIcon/> :
                                   <AddIcon/>
                               }
                               onClick={toComputeDietPatient ? saveComputedDiet : () => setToComputeDietPatient(patient)}
                       >
                               {diet.length < 7 ? toComputeDietPatient ? "Computing Diet" : "Generate new Diet" : "Add new Diet"}
                       </Button>
                   </span>
                </Tooltip>
            </Grid>
        </Grid>
        <DataGrid
            className={classes.table}
            rows={historicalDiets || []}
            columns={columns}
            initialState={{
                sorting: {
                    sortModel: [{ field: 'date', sort: 'desc' }],
                },
            }}
        />
    </div>
}