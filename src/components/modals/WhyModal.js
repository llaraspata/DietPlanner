import DialogTitle from "@mui/material/DialogTitle";
import {Grid,IconButton,Typography} from "@mui/material";
import CancelRoundedIcon from "@mui/icons-material/CancelRounded";
import React from "react";
import makeStyles from "@mui/styles/makeStyles";

import {
    Dialog,
    DialogContent
} from "@mui/material";

const useStyles = makeStyles((theme) => ({
    paper: {
        backgroundColor: theme.palette.primary.light,
        borderRadius: 0
    },
    root: {
        padding: "2rem",
        "&::-webkit-scrollbar": {
            width: 5,
        },
        "&::-webkit-scrollbar-thumb": {
            backgroundColor: theme.palette.primary.dark,
            borderRadius: "10px"
        },
    }
}));

/**Modal that shows for each type of inferred diet, why it was chosen taking into account the user's answers.**/
export default function WhyModal({open, onClose, suggestedTypes, dietTypes}) {

    const classes = useStyles();

    return <Dialog open={open} onClose={onClose} classes={{paper: classes.paper}}>
        <DialogTitle style={{textAlign: "right"}}>
            <IconButton aria-label="cancel" onClick={onClose}>
                <CancelRoundedIcon color="secondary"/>
            </IconButton>
        </DialogTitle>
        <DialogContent className={classes.root}>
            <Grid container spacing={2} direction="row" sx={{width: "30rem"}}>
                {
                    suggestedTypes.map(st => <Grid item>
                        <Typography fontWeight="bold" variant="h6">{dietTypes.find(dt => dt.id === st.id).value}</Typography>
                        <span>{st.value}</span>
                    </Grid>)
                }
            </Grid>
        </DialogContent>
    </Dialog>
}