import React from 'react';
import ReactDOM from 'react-dom/client';
import {createTheme} from "@mui/material";
import {StyledEngineProvider,ThemeProvider} from "@mui/material/styles";
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

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
      <StyledEngineProvider injectFirst>
          <ThemeProvider theme={defaultTheme}>
             <App />
          </ThemeProvider>
      </StyledEngineProvider>
  </React.StrictMode>
);