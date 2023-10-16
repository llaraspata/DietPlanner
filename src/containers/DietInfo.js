import {Button,Card,Grid} from "@mui/material";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import React from "react";
import Typography from "@mui/material/Typography";
import dayjs from "dayjs";
import TextItem from "../components/TextItem";

const fromPrologFormatToText = (word) => {
    const words = word.split('_');
    const firstWord = words[0].charAt(0).toUpperCase() + words[0].slice(1).toLowerCase();

    return [firstWord, ...words.slice(1)].join(' ');
}

function DayItem({dayDiet, index}) {

    return <Card sx={{width: "27rem", height: "67rem", borderRadius: '16px', padding: "2rem", margin: "2rem"}}>
        <Grid container spacing={2} direction="column">
            <Grid item container direction="row" justifyContent="space-between" alignItems="center">
                <Grid item>
                    <Typography fontWeight="bold" variant="h5">Day {index+1}</Typography>
                </Grid>
                <Grid item>
                    <b>{parseInt(dayDiet.calories)}kcal</b>
                </Grid>
            </Grid>
            {["breakfast", "snack1", "lunch", "snack2", "dinner"].map(meal => <Grid item>
                    <Grid container direction="row" justifyContent="space-between">
                        <Grid item>
                            <b>{meal.toUpperCase()}</b>
                        </Grid>
                        <Grid item>
                            {fromPrologFormatToText(dayDiet[meal].name)}
                        </Grid>
                    </Grid>
                    {dayDiet[meal].ingredients.map(i => <Grid container direction="row" justifyContent="space-between">
                            <Grid item>
                                {fromPrologFormatToText(i.name)}
                            </Grid>
                            <Grid item>
                                {i.grams}g
                            </Grid>
                        </Grid>
                    )}

                </Grid>
            )}
        </Grid>
    </Card>
}

export default function DietInfo({dietData, patient, onGoBack}) {

    return <div style={{ height: '80%', width: '100%' }}>
        <Grid container direction="row" justifyContent="space-between" alignItems="center" sx={{padding: "1rem"}}>
            <Grid item>
                <Button variant="outlined" fullWidth startIcon={<ArrowBackIcon/>} onClick={onGoBack}>
                    Go back
                </Button>
            </Grid>
            <Grid item>
                <Typography component="h2" variant="h5">
                    Diet for <b>{patient?.name} {patient?.surname}</b> computed date: {dayjs(dietData.date).format('DD/MM/YYYY - HH:mm')}
                </Typography>
            </Grid>
            <Grid item style={{visibility: "hidden"}}>
                <Button variant="outlined" fullWidth startIcon={<ArrowBackIcon/>} onClick={onGoBack}>
                    Go back
                </Button>
            </Grid>
        </Grid>
        <Card maxWidth sx={{padding: "1rem"}}>
            <Grid container alignItems={"flex-end"}>
                <Grid item xs={12} sm={6} md={4} alignItems={"flex-end"} style={{display: "flex"}}>
                    <TextItem label="Name">
                        {patient.name} {patient.surname}
                    </TextItem>
                </Grid>
                <Grid item xs={12} sm={6} md={4} alignItems={"flex-end"} style={{display: "flex"}}>
                    <TextItem label="Height">
                        {patient.height}
                    </TextItem>
                </Grid>
                <Grid item xs={12} sm={6} md={4} alignItems={"flex-end"} style={{display: "flex"}}>
                    <TextItem label="Weight">
                        {patient.weight}
                    </TextItem>
                </Grid>
                <Grid item xs={12} sm={6} md={4} alignItems={"flex-end"} style={{display: "flex"}}>
                    <TextItem label="BMI">
                        {patient.bmi}
                    </TextItem>
                </Grid>
                <Grid item xs={12} sm={6} md={4} alignItems={"flex-end"} style={{display: "flex"}}>
                    <TextItem label="Energy Demand">
                        {patient.energyDemand} kcal
                    </TextItem>
                </Grid>
                <Grid item xs={12} sm={6} md={3} alignItems={"flex-end"} style={{display: "flex"}}>
                    <TextItem label="Suggested Diets">
                        {patient.suggestedDiets.map(b => fromPrologFormatToText(b)).join(", ")}
                    </TextItem>
                </Grid>
            </Grid>
        </Card>
        <Grid container direction="row" justifyContent="space-around" alignItems="center">
            {dietData.diet.map((d, i) => <DayItem dayDiet={d} index={i}/>)}
        </Grid>
    </div>
}