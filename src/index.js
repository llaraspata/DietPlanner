import React,{Suspense} from 'react';
import ReactDOM from 'react-dom/client';
import {Button,createTheme} from "@mui/material";
import {StyledEngineProvider,ThemeProvider} from "@mui/material/styles";
import {SnackbarProvider} from "notistack";
import App from "./App";

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