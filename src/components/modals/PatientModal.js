import React,{useEffect,useState} from "react";
import DialogTitle from "@mui/material/DialogTitle";
import Dialog from "@mui/material/Dialog";
import DialogContent from "@mui/material/DialogContent";
import makeStyles from '@mui/styles/makeStyles';
import Pill from "../Pill";
import {Autocomplete,Button,Grid,IconButton,MenuItem} from "@mui/material";
import TextInput from "../TextInput";
import DeleteIcon from "@mui/icons-material/Delete";
import AddIcon from "@mui/icons-material/Add";
import {useGetActivityAllergenNames,useGetComputedCalories} from "../../services/interface";
import {styled} from "@mui/styles";

import CancelRoundedIcon from '@mui/icons-material/CancelRounded';
import CheckCircleRoundedIcon from '@mui/icons-material/CheckCircleRounded';

const useStyles = makeStyles((theme) => ({
    paper: {
        backgroundColor: theme.palette.primary.light,
        borderRadius: 0
    },
    root: {
        "&::-webkit-scrollbar": {
            width: 5,
        },
        "&::-webkit-scrollbar-thumb": {
            backgroundColor: theme.palette.primary.dark,
            borderRadius: "10px"
        },
    },
    form: {
        padding: theme.spacing(2),
    }
}));

const GENDERS = {
    male: "Male",
    female: "Female"
}

const MIN_AGE = 16
const MAX_AGE = 100
const MIN_HEIGHT = 0
const MAX_HEIGHT = 300
const MIN_WEIGHT = 0
const MAX_WEIGHT = 600
const MIN_NUMBER_DAYS_ON = 0
const MAX_NUMBER_DAYS_ON = 7
const MIN_NUMBER_DAYS_ON_ACTIVITY = 1
const MIN_ACTIVITY_DURATION = 1
const MAX_ACTIVITY_DURATION = 300

const PillsGridContainer = styled(Grid)(({ theme }) => ({
    paddingLeft: "1rem",
    backgroundColor : theme.palette.primary.light,
}));

export default function PatientModal({open, onClose, onSave, defaultPatient}) {

    const classes = useStyles();
    let {allergens, activities} = useGetActivityAllergenNames();
    const [patient, setPatient] = useState({});
    const [patientActivities, setPatientActivities] = useState([]);
    let energyDemand = useGetComputedCalories(structuredClone(patient));

    useEffect(() => {
        if(open && Object.keys(defaultPatient).length !== 0) {
            let def = structuredClone(defaultPatient)
            setPatientActivities(def.activities)
            delete def.activities
            setPatient(structuredClone(def))
        }
    }, [open])

    useEffect(() => {
        let newPatient = {...patient}
        newPatient.energyDemand = energyDemand
        setPatient(newPatient)
    }, [energyDemand])

    const onChange = (newValue, field) => {

        let newPatient = {...patient}

        if(field === "age") newPatient[field] = Math.min(MAX_AGE, Math.max(MIN_AGE, parseInt(newValue)))
        else if(field === "height") newPatient[field] = Math.min(MAX_HEIGHT, Math.max(MIN_HEIGHT, parseInt(newValue)))
        else if(field === "weight") newPatient[field] = Math.min(MAX_WEIGHT, Math.max(MIN_WEIGHT, newValue))
        else if(field === "numberDayOn") {
            newPatient[ field ] = Math.min(MAX_NUMBER_DAYS_ON,Math.max(MIN_NUMBER_DAYS_ON,parseInt(newValue)))
            if(newPatient[field] > 0 && patientActivities.length === 0) setPatientActivities([{
                activity: activities[0], numberDayOn: 1, avgMinutes: 1
            }])
            else if(newPatient[field] === 0 || newPatient[field] === null || newPatient[field] === undefined)
                setPatientActivities([])
        }
        else newPatient[field] = newValue

        if(newPatient.height && newPatient.weight) {
            let bmi = newPatient.weight / (newPatient.height / 100) / (newPatient.height / 100)
            newPatient.bmi = bmi
        } else newPatient.bmi = null

        setPatient(newPatient);
    }

    const onChangePatientActivity = (newValue, field, index) => {
        let newPatientActivities = structuredClone(patientActivities);
        const otherNumberDayOnSum = newPatientActivities.reduce((acc, obj, i) => i !== index ? acc + obj.numberDayOn : acc, 0);
        if(field === "numberDayOn")
            newPatientActivities[index][field] = Math.min(patient.numberDayOn-otherNumberDayOnSum, Math.max(MIN_NUMBER_DAYS_ON_ACTIVITY, parseInt(newValue)))
        else if(field === "avgMinutes")
            newPatientActivities[index][field] = Math.min(MAX_ACTIVITY_DURATION, Math.max(MIN_ACTIVITY_DURATION, parseInt(newValue)))
        else newPatientActivities[index][field] = newValue
        setPatientActivities(structuredClone(newPatientActivities))
    }

    const addActivity = () => {
        let newPatientActivities = structuredClone(patientActivities);
        newPatientActivities.push({activity: activities[0], numberDayOn: 0, avgMinutes: 1})
        setPatientActivities(structuredClone(newPatientActivities))
    }

    const deletePatientActivity = (index) => {
        let newPatientActivities = structuredClone(patientActivities);
        newPatientActivities.splice(index, 1)
        setPatientActivities(structuredClone(newPatientActivities))
    }

    const close = () => {
        setPatient({})
        setPatientActivities([])
        onClose()
    }

    const save = () => {
        onSave(patient, patientActivities)
        close()
    }

    const isSaveEnabled = () => {
        if(
            patient.name && patient.surname && patient.age && !isNaN(patient.age) && patient.gender &&
            patient.height && !isNaN(patient.height) && patient.weight && !isNaN(patient.weight) &&
            patient.numberDayOn !== null && patient.numberDayOn !== undefined && !isNaN(patient.numberDayOn)
        ) {
            if(patient.numberDayOn === 0) return true;
            else {
                let allCorrect = true
                patientActivities.map(pa => {
                    if(!pa.activity || !pa.numberDayOn || isNaN(pa.numberDayOn) || !pa.avgMinutes || isNaN(pa.avgMinutes))
                        allCorrect = false;
                })
                if(allCorrect) return true;
                else return false;
            }
        } else return false
    }

    return (
        <Dialog open={open} onClose={close} classes={{paper: classes.paper}}>
            <DialogTitle style={{textAlign: "right"}}>
                <IconButton aria-label="cancel" onClick={close}>
                    <CancelRoundedIcon color="secondary"/>
                </IconButton>
                <IconButton aria-label="save" onClick={save} disabled={!isSaveEnabled()}>
                    <CheckCircleRoundedIcon color={isSaveEnabled() ? "secondary" : "gray"}/>
                </IconButton>
            </DialogTitle>
            <DialogContent className={classes.root}>
                <Grid container justifyContent="space-between" spacing={1}>
                    <PillsGridContainer container xs={12} spacing={1}>
                        <Pill id={0} title={"Patient data"}>
                            <Grid container alignItems={"flex-end"} className={classes.form} spacing={3}>
                                <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.name} required
                                        onTextChange={(value) => onChange(value, "name")}
                                        label="Name"
                                    />
                                </Grid>
                                <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.surname} required
                                        onTextChange={(value) => onChange(value, "surname")}
                                        label="Surname"
                                    />
                                </Grid>
                                <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.age} required
                                        onTextChange={(value) => onChange(value, "age")}
                                        label="Age" type="number" min={16} max={100}
                                    />
                                </Grid>
                                <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput label="Gender" value={patient.gender || ''} type={"select"} select
                                               onTextChange={value => onChange(value, "gender")} required>
                                        <MenuItem key={GENDERS.male} value={GENDERS.male}>{GENDERS.male}</MenuItem>
                                        <MenuItem key={GENDERS.female} value={GENDERS.female}>{GENDERS.female}</MenuItem>
                                    </TextInput>
                                </Grid>
                                <Grid item xs={12} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <Autocomplete
                                        multiple fullWidth filterSelectedOptions disableCloseOnSelect
                                        value={patient.allergies || []}
                                        onChange={(evt, newValue) =>
                                            onChange(newValue, "allergies")
                                        }
                                        id="allergies"
                                        options={allergens}
                                        getOptionLabel={(option) => option}
                                        renderInput={(params) => (
                                            <TextInput {...params} label="Allergies"/>
                                        )}
                                    />
                                </Grid>
                            </Grid>
                        </Pill>
                        <Pill id={1} title={"BMI Computation"}>
                            <Grid container alignItems={"flex-end"} className={classes.form} spacing={3}>
                                <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.height} required type="number" step={1} min={MIN_HEIGHT} max={MAX_HEIGHT}
                                        onTextChange={(value) => onChange(value, "height")}
                                        label="Height (cm)"
                                    />
                                </Grid>
                                <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.weight} required type="number" min={MIN_WEIGHT} max={MAX_WEIGHT}
                                        onTextChange={(value) => onChange(value, "weight")}
                                        label="Weight (kg)" step={1}
                                    />
                                </Grid>
                                <Grid item xs={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.bmi?.toFixed(2)} InputLabelProps={{shrink: !!patient.bmi}}
                                        label="BMI" disabled
                                    />
                                </Grid>
                                <Grid item xs={6} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.energyDemand}
                                        InputLabelProps={{shrink: !!patient.energyDemand}}
                                        label="Energy demand (kcal)" disabled
                                    />
                                </Grid>
                            </Grid>
                        </Pill>
                        <Pill id={2} title="Physical activity">
                            <Grid container alignItems={"flex-end"} className={classes.form} spacing={3}>
                                <Grid item xs={12} alignItems={"flex-end"} style={{display: "flex"}}>
                                    <TextInput
                                        value={patient.numberDayOn} required type="number"
                                        label="Days a week of physical activity"
                                        step={1} min={MIN_NUMBER_DAYS_ON} max={MAX_NUMBER_DAYS_ON}
                                        onTextChange={(value) => onChange(value, "numberDayOn")}
                                    />
                                </Grid>
                            </Grid>

                            {
                                patientActivities.map((pa, index) => {
                                    const otherNumberDayOnSum = patientActivities.reduce((acc, obj, i) => i !== index ? acc + obj.numberDayOn : acc, 0);
                                    return <Grid container alignItems={"center"} className={classes.form} spacing={3}>
                                        <Grid item xs={4} alignItems={"flex-end"} style={{display : "flex"}}>
                                            <Autocomplete
                                                fullWidth value={pa.activity}
                                                onChange={(evt,newValue) =>
                                                    onChangePatientActivity(newValue,"activity",index)
                                                }
                                                id={`activity-${index}`} options={activities.map(a => a)}
                                                getOptionLabel={(option) => option}
                                                renderInput={(params) => (
                                                    <TextInput {...params} label="Activity"/>
                                                )}
                                            />
                                        </Grid>
                                        <Grid item xs={3.5} alignItems={"flex-end"} style={{display : "flex"}}>
                                            <TextInput
                                                value={pa.numberDayOn} required type="number"
                                                label="Days a week this activity" id={`numberDayOn-${index}`}
                                                step={1} min={MIN_NUMBER_DAYS_ON_ACTIVITY} max={patient.numberDayOn-otherNumberDayOnSum}
                                                onTextChange={(value) => onChangePatientActivity(value,"numberDayOn",index)}
                                            />
                                        </Grid>
                                        <Grid item xs={3.5} alignItems={"flex-end"} style={{display : "flex"}}>
                                            <TextInput
                                                value={pa.avgMinutes} required type="number"
                                                label="Minutes for a session" id={`avgMinutes-${index}`}
                                                step={1} min={MIN_ACTIVITY_DURATION} max={MAX_ACTIVITY_DURATION}
                                                onTextChange={(value) => onChangePatientActivity(value,"avgMinutes",index)}
                                            />
                                        </Grid>
                                        {index !== 0 &&
                                            <Grid item xs={1} spacing={0}>
                                                <IconButton aria-label="delete"
                                                            onClick={() => deletePatientActivity(index)}>
                                                    <DeleteIcon/>
                                                </IconButton>
                                            </Grid>
                                        }
                                    </Grid>
                                })
                            }
                            {patient.numberDayOn > 0 &&
                                <Grid container alignItems={"flex-end"} className={classes.form}>
                                    <Grid item xs={12} alignItems={"flex-end"} style={{display : "flex"}}>
                                        <Button variant="outlined" fullWidth startIcon={<AddIcon/>} onClick={addActivity}>
                                            Add Activity
                                        </Button>
                                    </Grid>
                                </Grid>
                            }

                        </Pill>
                    </PillsGridContainer>
                </Grid>
            </DialogContent>
        </Dialog>
    );
}