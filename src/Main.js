import {CssBaseline} from "@mui/material";
import Header from "./components/Header";
import {makeStyles} from "@mui/styles";
import Users from "./containers/Users";

const useStyles = makeStyles((theme) => ({
    root: {
        display: 'flex',
        minHeight: '100vh'
    },
    toolbar: {
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'flex-end',
        padding: theme.spacing(0, 1),
        // necessary for content to be below app bar
        ...theme.mixins.toolbar,
    },
    content: {
        flexGrow: 1,
        padding: theme.spacing(3),
    },
}));

/**Component that displays the header and sidebar, then calls Users as a child**/
export default function Main(){

    const classes = useStyles();

    return <div className={classes.root}>
        <CssBaseline/>
        <Header/>

        <main className={classes.content}>
            <div className={classes.toolbar}/>
            <Users/>
        </main>
    </div>

}