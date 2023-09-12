import {styled} from "@mui/styles";
import {Accordion,AccordionDetails,AccordionSummary,Grid,Typography} from "@mui/material";
import React,{useState} from "react";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";

const CustomAccordion = styled(Accordion)(({ theme }) => ({
    margin: theme.spacing(1),
    '&.Mui-expanded': {
        border: "3px solid" + theme.palette.secondary.main,
    },
}));

export default function Pill ({id, title, children}) {

    let [expanded,setExpanded] = useState(false);

    return (
        <Grid item lg={12} xs={12} key={id}>
            <CustomAccordion
                TransitionProps={{unmountOnExit : true}}
                square
                onChange={(e,expanded) => setExpanded(expanded)}
            >
                <AccordionSummary
                    expandIcon={<ExpandMoreIcon color={expanded ? "secondary" : "primary"}/>}
                    aria-controls="panel1a-content"
                    id={id}
                >
                    <Grid alignItems={"center"} container direction="row">
                        <Typography sx={{width:'100%', fontWeight: "bold"}} color={"textPrimary"}>
                            {title}
                        </Typography>
                    </Grid>
                </AccordionSummary>
                <AccordionDetails>
                    {children}
                </AccordionDetails>
            </CustomAccordion>
        </Grid>
    );
}