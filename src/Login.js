import React,{useEffect,useState} from 'react';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import makeStyles from '@mui/styles/makeStyles';
import Container from '@mui/material/Container';
import InputAdornment from "@mui/material/InputAdornment";
import IconButton from "@mui/material/IconButton";
import {Visibility,VisibilityOff} from "@mui/icons-material";
import {useAuthState} from "react-firebase-hooks/auth";
import {useNavigate} from "react-router-dom";
import {auth, logInWithEmailAndPassword} from "./firebase";

const useStyles = makeStyles((theme) => ({
    paper: {
        marginTop: theme.spacing(8),
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
    },
    avatar: {
        margin: theme.spacing(1),
        backgroundColor: theme.palette.secondary.main,
    },
    form: {
        width: '100%', // Fix IE 11 issue.
        marginTop: theme.spacing(1),
    },
    submit: {
        margin: theme.spacing(3, 0, 2),
        backgroundColor: theme.palette.primary.dark,
        color: theme.palette.primary.contrastText,
        '&:hover': {
            backgroundColor: theme.palette.secondary.main,
            color: theme.palette.text.primary,
        }
    },
    forgot: {
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        color: theme.palette.text.primary,
        textDecoration:"underline",
        '&:hover': {
            cursor: 'pointer'
        }
    },
}));

export default function Login(){

    //dietologo@studenti.uniba.it
    //Password00!

    const classes = useStyles();

    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    let [showPassword, setShowPassword] = useState(false);
    const [user, loading, error] = useAuthState(auth);
    const navigate = useNavigate();

    useEffect(() => {
        if (loading) {
            // maybe trigger a loading screen
            return;
        }
        if (user) navigate("/");
    }, [user, loading]);

    const preventLoseFocus = (event) => {
        event.preventDefault()
    }

    const onKeyPress = (ev) => {
        if (ev.key === 'Enter') {
            logInWithEmailAndPassword(username, password);
            ev.preventDefault();
        }
    }

    return <Container component="main" maxWidth="xs">
        <CssBaseline />
        <div className={classes.paper}>
            <Avatar className={classes.avatar}>
                <LockOutlinedIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
                Login
            </Typography>
            <TextField
                variant="outlined"
                margin="normal"
                required
                fullWidth
                id="email"
                label="Email"
                name="email"
                autoComplete="email"
                autoFocus
                onChange={event => {
                    setUsername(event.target.value);
                }}
                value={username}
                onKeyPress={onKeyPress}
            />
            <TextField
                variant="outlined"
                margin="normal"
                required
                fullWidth
                name="password"
                label="Password"
                type={showPassword ? "text" : "password"}
                id="password"
                autoComplete="current-password"
                onChange={event => {
                    setPassword(event.target.value);
                }}
                InputProps={{
                    endAdornment: (
                        <InputAdornment position="end">
                            <IconButton
                                aria-label="toggle password visibility"
                                onClick={() => setShowPassword(!showPassword)}
                                onMouseDown={preventLoseFocus}
                                onMouseUp={preventLoseFocus}
                                edge="end"
                                size="large">
                                {showPassword ? <Visibility /> : <VisibilityOff />}
                            </IconButton>
                        </InputAdornment>)
                }}
                value={password}
                onKeyPress={onKeyPress}
            />
            <Button
                fullWidth
                variant="contained"
                color="secondary"
                className={classes.submit}
                onClick={() => {
                    logInWithEmailAndPassword(username, password);
                }}
            >
                Login
            </Button>
        </div>
    </Container>
}