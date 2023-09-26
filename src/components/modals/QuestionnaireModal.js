import React from "react";
import makeStyles from "@mui/styles/makeStyles";
import DialogTitle from "@mui/material/DialogTitle";
import {Dialog,DialogContent,IconButton} from "@mui/material";

import CancelRoundedIcon from "@mui/icons-material/CancelRounded";
import CheckCircleRoundedIcon from "@mui/icons-material/CheckCircleRounded";

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

export default function QuestionnaireModal({open, onClose, onSave}) {

    const classes = useStyles();

    const close = () => {
        onClose()
    }

    const save = () => {
        onSave()
        close()
    }

    return <Dialog open={open} onClose={close} classes={{paper: classes.paper}}>
        <DialogTitle style={{textAlign: "right"}}>
            <IconButton aria-label="cancel" onClick={close}>
                <CancelRoundedIcon color="secondary"/>
            </IconButton>
            <IconButton aria-label="save" onClick={save}>
                <CheckCircleRoundedIcon color="secondary"/>
            </IconButton>
        </DialogTitle>
        <DialogContent className={classes.root}>
        </DialogContent>
    </Dialog>
}