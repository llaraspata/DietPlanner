import {AppBar,Toolbar, Typography, IconButton} from "@mui/material";
import Logout from '@mui/icons-material/Logout';
import {makeStyles} from "@mui/styles";
import {logout} from "../firebase";

const useStyles = makeStyles((theme) => ( {
    appBar : {
        backgroundColor : theme.palette.secondary.main,
        zIndex : theme.zIndex.drawer + 1,
        transition : theme.transitions.create(['width','margin'],{
            easing : theme.transitions.easing.sharp,
            duration : theme.transitions.duration.leavingScreen,
        }),
    },
}));

/**Header present at the top of the web-app, with a logout button.**/
export default function Header(){

    const classes = useStyles();

    return <AppBar className={classes.appBar}>
        <Toolbar>
            <Typography variant="h6" component="div">
                DietPlanner
            </Typography>
            <div style={{flexGrow: 1}}/>
            <IconButton aria-label="logout" onClick={logout}>
                <Logout fontSize="medium"/>
            </IconButton>
        </Toolbar>
    </AppBar>
}