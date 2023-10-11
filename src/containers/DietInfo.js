import {Button,Card,Grid} from "@mui/material";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import React from "react";
import Typography from "@mui/material/Typography";
import dayjs from "dayjs";

function DayItem({dayDiet, index}) {

    const fromPrologFormatToText = (word) => {
        const words = word.split('_');
        const firstWord = words[0].charAt(0).toUpperCase() + words[0].slice(1).toLowerCase();

        return [firstWord, ...words.slice(1)].join(' ');
    }

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
        <Grid container direction="row" justifyContent="space-around" alignItems="center">
            {dietData.diet.map((d, i) => <DayItem dayDiet={d} index={i}/>)}
        </Grid>
    </div>
}