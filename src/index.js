import React,{Suspense} from 'react';
import ReactDOM from 'react-dom/client';
import {Button,createTheme} from "@mui/material";
import {StyledEngineProvider,ThemeProvider} from "@mui/material/styles";
import {SnackbarProvider} from "notistack";
import App from "./App";

/**Defines the default theme used in the web-app
editing this will change the web-app colours**/
const defaultTheme = createTheme({
    palette : {
        primary : {
            main : '#022600',
            light : "#dfffdd",
            dark : "#8dff00",
            contrastText : '#fff',
            error : "#ff0000",
        },
        secondary : {
            main : 'rgba(3,107,84,0.95)',
        },
        text : {
            primary : "rgb(0,0,0)"
        }
    }
});

const notistackRef = React.createRef();
const onClickDismiss = key => () => {
    notistackRef.current.closeSnackbar(key);
};

const root = ReactDOM.createRoot(document.getElementById('root'));

/**Render the main react components with some providers to define the app theme and the snackbar behavior**/
root.render(
  <React.StrictMode>
      <StyledEngineProvider injectFirst>
          <ThemeProvider theme={defaultTheme}>
              <SnackbarProvider
                  ref={notistackRef}
                  action={(key) => (
                      <Button onClick={onClickDismiss(key)}>
                          'Close'
                      </Button>
                  )}
                  autoHideDuration={3000}>
                  <Suspense fallback="Loading...">
                      <App />
                  </Suspense>
              </SnackbarProvider>
          </ThemeProvider>
      </StyledEngineProvider>
  </React.StrictMode>
);