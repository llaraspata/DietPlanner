import {useState} from "react";
import {Redirect,Route,Switch} from "react-router-dom";
import Login from "./Login";
import Main from "./Main";

export default function App() {

    let [user, setUser] = useState({loggedIn: false})

    return <Switch>
            <UnloggedRoute user={user} path="/login">
                <Login setUser={setUser}/>
            </UnloggedRoute>
            <PrivateRoute user={user} path="/">
                <div>SEI DENTRO</div>
            </PrivateRoute>
        </Switch>
}

// A wrapper for <Route> that redirects to the login
// screen if you're not yet authenticated.
function PrivateRoute({ user, children, ...rest }) {
    return (
        <Route
            {...rest}
            render={({ location }) =>
                user.loggedIn ? (
                    children
                ) : (
                    <Redirect
                        to={{
                            pathname: "/login",
                            state: { from: location }
                        }}
                    />
                )
            }
        />
    );
}

function UnloggedRoute({ user, children, ...rest }) {
    return (
        <Route
            {...rest}
            render={() =>
                user.loggedIn ? (
                    <Redirect
                        to={{
                            pathname: "/"
                        }}
                    />
                ) : (
                    children
                )
            }
        />
    );
}