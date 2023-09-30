import React,{useEffect,useState} from "react";
import makeStyles from "@mui/styles/makeStyles";
import DialogTitle from "@mui/material/DialogTitle";
import {
    Autocomplete,
    Button,
    Dialog,
    DialogContent,
    Divider,
    FormControl,
    FormControlLabel,
    FormLabel,
    Grid,
    IconButton,MenuItem,
    Radio,
    RadioGroup
} from "@mui/material";

import CancelRoundedIcon from "@mui/icons-material/CancelRounded";
import EditIcon from '@mui/icons-material/Edit';
import SaveIcon from '@mui/icons-material/Save';

import {useGetAllDietTypes,useGetQuestions,useGetSuggestedDietTypes} from "../../services/interface";
import TextInput from "../TextInput";

const useStyles = makeStyles((theme) => ({
    paper: {
        backgroundColor: theme.palette.primary.light,
        borderRadius: 0
    },
    root: {
        padding: "2rem",
        "&::-webkit-scrollbar": {
            width: 5,
        },
        "&::-webkit-scrollbar-thumb": {
            backgroundColor: theme.palette.primary.dark,
            borderRadius: "10px"
        },
    },
    form: {
        padding: theme.spacing(2),
    }
}));

export const INFERENCE_METHODS = {
    forward: "Forward",
    backward: "Backward"
}

export default function QuestionnaireModal({open, onClose, onSave}) {

    const classes = useStyles();
    const [answeredQuestions, setAnsweredQuestions] = useState([]);
    const [inferenceMethod, setInferenceMethod] = useState(null);
    const [isEditingManually, setIsEditingManually] = useState(false);
    const [localSuggestedTypes, setLocalSuggestedTypes] = useState([])
    const {newQuestion, newAnswers, newQuestionId} = useGetQuestions(answeredQuestions)
    const suggestedTypes = useGetSuggestedDietTypes(answeredQuestions, inferenceMethod)
    const dietTypes = useGetAllDietTypes()

    useEffect(() => {
        if(suggestedTypes && localSuggestedTypes.length === 0 && suggestedTypes.length !== 0)
            setLocalSuggestedTypes(suggestedTypes)
    }, [suggestedTypes])

    const close = () => {
        setAnsweredQuestions([])
        setInferenceMethod(null)
        setIsEditingManually(false)
        setLocalSuggestedTypes([])
        onClose()
    }

    const save = () => {
        onSave(localSuggestedTypes)
        close()
    }

    const onChangeNewQuestion = (evt) => {
        let newAnsweredQuestions = structuredClone(answeredQuestions)
        newAnsweredQuestions.push({
            questionId: newQuestionId,
            question: newQuestion,
            answers: newAnswers,
            answerId: evt.target.value
        })
        setAnsweredQuestions(newAnsweredQuestions)
    }

    const onChangeOldQuestion = (newValue, index) => {
        let newAnsweredQuestions = structuredClone(answeredQuestions)
        newAnsweredQuestions.splice(index + 1, newAnsweredQuestions.length - index);
        newAnsweredQuestions[index] = {
            ...newAnsweredQuestions[index],
            answerId: newValue
        }
        setAnsweredQuestions(newAnsweredQuestions)
        setInferenceMethod(null)
        setInferenceMethod(null)
        setIsEditingManually(false)
        setLocalSuggestedTypes([])
    }

    return <Dialog open={open} onClose={close} classes={{paper: classes.paper}}>
        <DialogTitle style={{textAlign: "right"}}>
            <IconButton aria-label="cancel" onClick={close}>
                <CancelRoundedIcon color="secondary"/>
            </IconButton>
        </DialogTitle>
        <DialogContent className={classes.root}>
            <Grid container direction="column" spacing={2} sx={{paddingTop: "1rem"}}>
                {
                    answeredQuestions.map((a, index) => <Grid item>
                            <FormControl id={`answeredQuestions-${index}`}>
                                <FormLabel>{`${index + 1}. ${a.question}`}</FormLabel>
                                <RadioGroup row id={`answeredQuestions-RadioGroup-${index}`} value={a.answerId}
                                            onChange={evt => onChangeOldQuestion(evt.target.value, index)} >
                                    {
                                        a.answers.map(a =>
                                            <FormControlLabel value={a.id} control={<Radio />} label={a.value} />)
                                    }
                                </RadioGroup>
                            </FormControl>
                            <Divider />
                        </Grid>
                    )
                }
                {newQuestion !== null &&
                    <Grid item>
                        <FormControl id={`newQuestion-${newQuestionId}`}>
                            <FormLabel>{`${answeredQuestions.length + 1}. ${newQuestion}`}</FormLabel>
                            <RadioGroup row id={`newQuestion-RadioGroup-${newQuestionId}`}
                                        onChange={onChangeNewQuestion} value={null}>
                                {
                                    newAnswers.map(a =>
                                        <FormControlLabel value={a.id} label={a.value}
                                                          control={<Radio id={`newQuestion-${newQuestionId}-${a.id}`}/>}
                                        />
                                    )
                                }
                            </RadioGroup>
                        </FormControl>
                        <Divider/>
                    </Grid>
                }
                {newQuestion === null &&
                    <>
                        <Grid item/>
                        <Grid item>
                            <TextInput label="Inference Method" value={inferenceMethod} type={"select"} select
                                       onTextChange={value => setInferenceMethod(value)} required>
                                <MenuItem key={INFERENCE_METHODS.forward} value={INFERENCE_METHODS.forward}>
                                    {INFERENCE_METHODS.forward}
                                </MenuItem>
                                <MenuItem key={INFERENCE_METHODS.backward} value={INFERENCE_METHODS.backward}>
                                    {INFERENCE_METHODS.backward}
                                </MenuItem>
                            </TextInput>
                        </Grid>
                        <Grid item/>
                        <Divider sx={{ bgcolor: "primary.main" }}/>
                    </>
                }
                {suggestedTypes.length !== 0 &&
                    <>
                        <Grid item>
                            Inferred Diet Types: <br/>
                            <ul>
                            {
                                suggestedTypes.map(st => <li><b>{dietTypes.find(dt => dt.id === st).value}</b></li>)
                            }
                            </ul>
                        </Grid>
                        {!isEditingManually &&
                            <Grid item>
                                <Button variant="outlined" fullWidth startIcon={<EditIcon/>} onClick={() => setIsEditingManually(true)}>
                                    Edit Manually
                                </Button>
                            </Grid>
                        }
                        {isEditingManually &&
                            <Grid item>
                                <Autocomplete
                                    multiple fullWidth filterSelectedOptions disableCloseOnSelect id="localSuggestedTypes-Autocomplete"
                                    value={localSuggestedTypes ? dietTypes.filter(dt => localSuggestedTypes.includes(dt.id)).map(s => s.value) : []}
                                    onChange={(evt, newValue) => setLocalSuggestedTypes(dietTypes.filter(dt => newValue.includes(dt.value)).map(s => s.id))}
                                    options={dietTypes.map(s => s.value)}
                                    getOptionLabel={(option) => option}
                                    renderInput={(params) => (
                                        <TextInput {...params} label="Diet Types"/>
                                    )}
                                />
                            </Grid>
                        }
                        <Grid item>
                            <Button variant="contained" fullWidth startIcon={<SaveIcon/>} onClick={save}>
                                Save
                            </Button>
                        </Grid>
                    </>
                }
            </Grid>
        </DialogContent>
    </Dialog>
}