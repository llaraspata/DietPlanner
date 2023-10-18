import React from "react";
import Box from "@mui/material/Box";
import {makeStyles} from "@mui/styles";
import clsx from "clsx";

const useStyles = makeStyles(theme => ({
	box: {
		padding: theme.spacing(1),
		margin: theme.spacing(1),
		borderBottom: `${theme.palette.secondary.main} 1px solid`,
		color: theme.palette.secondary.main,
		fontWeight: "bold",
		flexGrow: 1,
	},
}));

export default function TextItem({label, className, children}) {
	let innerClasses = useStyles();

	return <Box xs={6} className={clsx(innerClasses.box, className)}>
		<div style={{ fontWeight: "normal" }}>{label}</div>
		<div style={{ marginLeft: "1rem" }}>
			{children}
		</div>
	</Box>
}
