import {makeStyles,styled} from "@mui/styles";
import {Autocomplete,Grid,MenuItem} from "@mui/material";
import {useEffect,useState} from "react";
import TextInput from "../components/TextInput";
import Pill from "../components/Pill";

const useStyles = makeStyles(theme => ({
    form: {
        padding: theme.spacing(2),
    }
}));

const GENDERS = {
    male: "Maschio",
    female: "Femmina"
}

const PillsGridContainer = styled(Grid)(({ theme }) => ({
    padding : "3rem",
    backgroundColor : theme.palette.primary.light,
}));

export default function Patient() {

    let classes = useStyles();
    const [patient, setPatient] = useState({});

    useEffect(() => {
        if(patient.height && patient.weight) {
            let bmi = patient.weight / patient.height / patient.height
            setPatient({...patient, bmi})
        } else setPatient({...patient, bmi: null})
    }, [patient])

    const onChange = (newValue, field) => {
        setPatient({ ...patient, [field]: newValue });
    }

    return <Grid container justifyContent="space-between" spacing={2}>
        <PillsGridContainer container xs={12} spacing={1}>
            <Pill id={0} title={"Anagrafica Paziente"}>
                <Grid container alignItems={"flex-end"} className={classes.form} spacing={3}>
                    <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                        <TextInput
                            value={patient.name} required
                            onTextChange={(value) => onChange(value, "name")}
                            label="Nome"
                        />
                    </Grid>
                    <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                        <TextInput
                            value={patient.surname} required
                            onTextChange={(value) => onChange(value, "surname")}
                            label="Cognome"
                        />
                    </Grid>
                    <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                        <TextInput
                            value={patient.birth} required
                            onTextChange={(value) => onChange(value, "birth")}
                            label="Data di Nascita" type="date" InputLabelProps={{shrink: true}}
                        />
                    </Grid>
                    <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                        <TextInput label="Sesso" value={patient.gender || ''} type={"select"} select
                                   onTextChange={value => onChange(value, "gender")} required>
                            <MenuItem key={GENDERS.male} value={GENDERS.male}>{GENDERS.male}</MenuItem>
                            <MenuItem key={GENDERS.female} value={GENDERS.female}>{GENDERS.female}</MenuItem>
                        </TextInput>
                    </Grid>
                </Grid>
            </Pill>
            <Pill id={1} title={"Calcolo BMI"}>
                <Grid container alignItems={"flex-end"} className={classes.form} spacing={3}>
                    <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                        <TextInput
                            value={patient.height} required type="number" step={0.1}
                            onTextChange={(value) => onChange(value, "height")}
                            label="Altezza (m)"
                        />
                    </Grid>
                    <Grid item xs={12} sm={6} alignItems={"flex-end"} style={{display: "flex"}}>
                        <TextInput
                            value={patient.weight} required type="number"
                            onTextChange={(value) => onChange(value, "weight")}
                            label="Peso (kg)"
                        />
                    </Grid>
                    <Grid item xs={12} alignItems={"flex-end"} style={{display: "flex"}}>
                        <TextInput
                            value={patient.bmi?.toFixed(2)} InputLabelProps={{shrink: !!patient.bmi}}
                            label="BMI" disabled
                        />
                    </Grid>
                </Grid>
            </Pill>
            <Pill id={2} title={"Dati personali"}>
                <Grid container alignItems={"flex-end"} className={classes.form} spacing={3}>
                    <Grid item xs={12} alignItems={"flex-end"} style={{display: "flex"}}>
                        <Autocomplete
                            multiple fullWidth filterSelectedOptions disableCloseOnSelect
                            value={patient.allergies}
                            onChange={(evt, newValue) => onChange(newValue, "allergies")}
                            id="allergies"
                            options={["Pesce", "Riso", "Carne"]}
                            getOptionLabel={(option) => option}
                            renderInput={(params) => (
                                <TextInput {...params} label="Allergie"/>
                            )}
                        />
                    </Grid>
                </Grid>
            </Pill>
        </PillsGridContainer>
    </Grid>

}