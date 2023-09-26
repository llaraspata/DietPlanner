import {BrowserRouter as Router, Route, Routes, Navigate } from "react-router-dom";
import Login from "./Login";
import Main from "./Main";
import {useAuthState} from "react-firebase-hooks/auth";
import {auth} from "./firebase";
import {CircularProgress} from "@mui/material";
import {useGetFirstQuestion} from "./services/interface";

export default function App() {

    const [user, loading] = useAuthState(auth);

    useGetFirstQuestion();

    if(loading) return <CircularProgress />

    return <Router>
        <Routes>
            <Route exact path="/login" element={!user ? <Login /> :  <Navigate to="/"/>}/>
            <Route exact path="/" element={user ? <Main /> : <Navigate to="/login"/>}/>
        </Routes>
    </Router>
}