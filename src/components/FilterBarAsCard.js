import {alpha, Box, Card, Grid} from "@mui/material";
import makeStyles from '@mui/styles/makeStyles';
import clsx from "clsx"

const useStyles = makeStyles((theme) => ({
    button: {
        backgroundColor: alpha(theme.palette.primary.main, 0.5),
        color: theme.palette.primary.dark,
        padding: "0.75rem 1rem",
        verticalAlign: "middle",
        textAlign:"center",
        fontSize: "0.875rem",
        lineHeight: "1.25",
        fontWeight: 700,
        fontFamily: "sans-serif",
        cursor: "pointer",
        marginRight: "0.3rem",
        minWidth:"5rem",
        '&:hover': {
            backgroundColor:theme.palette.secondary.main,
            color: "#FFF"
        },
        borderRadius: "0.5rem 0.5rem 0 0"
    },
    selected: {
        backgroundColor:theme.palette.primary.light,
        color: "#000"
    },
    card: {
        borderTopLeftRadius: 0,
        backgroundColor:theme.palette.primary.light,
    }
}));

export default function FilterBarAsCard({filters, onFilter, selected, children}) {

    const classes = useStyles();

    return <>
        <Grid container>
            <Grid item>
                <Grid container>
                    {
                        filters.map(({id, name}) =>
                            <Box
                                onClick={() => {
                                    onFilter && onFilter(id);
                                }}
                                className={clsx(classes.button, {[classes.selected]:selected === id})}
                                key={id}
                            >
                                {name}
                            </Box>
                        )
                    }
                </Grid>
            </Grid>
        </Grid>
        <Card className={classes.card}>
            {children}
        </Card>
    </>
}