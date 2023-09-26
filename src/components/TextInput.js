import React,{useState} from "react";
import TextField from "@mui/material/TextField";
import InputAdornment from "@mui/material/InputAdornment";
import {Visibility,VisibilityOff} from "@mui/icons-material";

export default function TextInput({label, value, onTextChange, required, error, readOnly, type = "text", step, min, max, noHelperText, multiline,
									  startAdornment, helperText, rows, select, InputLabelProps, showPasswordIcon, autoComplete = 'new-password',
									  InputProps, onClick, autoFocus, disabled, inputProps, children, color = 'dark', onKeyPress, ...params}) {
	let [showPassword, setShowPassword] = useState(false);

	const preventLoseFocus = (event) => {
		event.preventDefault()
	}

	return (
		<TextField
			variant="outlined"
			fullWidth
			label={label}
			value={value}
			onChange={({target}) => onTextChange && onTextChange(target.value)}
			required={required}
			multiline={multiline}
			error={error}
			helperText={
				!noHelperText && (
					<>
						{
							helperText &&
							<span>{helperText}</span>
						} {helperText && <br/>} {error || ''}
					</>
				)
			}
			inputProps={inputProps || {
				readOnly,
				type: showPassword ? "text" : type,
				step, min, max,
				autoComplete: autoComplete,
			}}
			InputProps={InputProps || {
				endAdornment: (showPasswordIcon &&
					<InputAdornment position="end" sx={{cursor: 'pointer'}}>
						{showPassword ?
							<Visibility onClick={() => setShowPassword(false)} onMouseUp={preventLoseFocus}
										onMouseDown={preventLoseFocus} color={color === 'dark' ? "secondary" : "inherit"}/> :
							<VisibilityOff onClick={() => setShowPassword(true)} onMouseUp={preventLoseFocus}
										   onMouseDown={preventLoseFocus} color={color === 'dark' ? "secondary" : "inherit"}/>}
					</InputAdornment>),
				startAdornment
			}}
			rows={rows}
			select={select}
			InputLabelProps={InputLabelProps}
			onClick={onClick}
			autoFocus={autoFocus}
			disabled={disabled}
			onKeyPress={onKeyPress}
			{...params}
		>
			{children}
		</TextField>
	);
}
