import {useEffect,useState} from "react";
import functions from '../prolog/functions.pl'
import instances from '../prolog/instances.pl'

import utilities from "../prolog/diet_type/utilities.pl"
import questionnaire from "../prolog/diet_type/questionnaire.pl"
import rules from "../prolog/diet_type/rules.pl"
import inference_engine from "../prolog/diet_type/inference_engine.pl"

import {INFERENCE_METHODS} from "../components/modals/QuestionnaireModal";

const pl = require('tau-prolog');
const listLoader = require("tau-prolog/modules/lists.js");
const randomLoader = require("tau-prolog/modules/random.js")

function fromList(xs) {
    let arr = [];
    while(pl.type.is_term(xs) && xs.indicator === "./2") {
        arr.push(xs.args[0]);
        xs = xs.args[1];
    }
    if(pl.type.is_term(xs) && xs.indicator === "[]/0")
        return arr;
    return null;
}

async function consultFunctionsInstances(session){
    const functionsCode = await fetch(functions).then((res) => res.text()).then((program) => program)
    const instancesCode = await fetch(instances).then((res) => res.text()).then((program) => program)
    session.consult(functionsCode);
    session.consult(instancesCode);
}

async function consultUtilitiesQuestionnaire(session){
    const utilitiesCode = await fetch(utilities).then((res) => res.text()).then((program) => program)
    const questionnaireCode = await fetch(questionnaire).then((res) => res.text()).then((program) => program)
    session.consult(utilitiesCode);
    session.consult(questionnaireCode);
}

async function consultUtilitiesQuestionnaireRulesInferenceEngine(session){
    await consultUtilitiesQuestionnaire(session);
    const rulesCode = await fetch(rules).then((res) => res.text()).then((program) => program)
    const inferenceEngineCode = await fetch(inference_engine).then((res) => res.text()).then((program) => program)
    session.consult(rulesCode);
    session.consult(inferenceEngineCode);
}

export function useGetActivityAllergenNames() {

    let session = pl.create();
    let [allergens, setAllergens] = useState([])
    let [activities, setActivities] = useState([])

    useEffect(() => {
        consultFunctionsInstances(session).then(() => {
            session.query("collect_allergen_names(Names).");
            session.answer(a => {
                setAllergens(fromList(a.lookup("Names")).map(t => t.id))
            })
            session.query("collect_activities_names(Names).");
            session.answer(a => {
                setActivities(fromList(a.lookup("Names")).map(t => t.id))
            })
        })
    }, [])

    return {allergens, activities}
}

export function useGetComputedCalories(patient){

    let session = pl.create();
    let [energyDemand, setEnergyDemand] = useState()

    useEffect(() => {
        if(patient && patient.name && patient.surname && patient.age &&
            patient.gender && patient.height && patient.weight) {
            consultFunctionsInstances(session).then(() => {
                patient.name = patient.name.replace(/\s/g, '');
                patient.surname = patient.surname.replace(/\s/g, '');
                let patientCode = `${patient.name.toLowerCase()}_${patient.surname.toLowerCase()}`
                session.consult(`
                    person_instance(dietplanner, person, ${patientCode}).
                    attribute_value(dietplanner, ${patientCode}, name, ${patient.name}).
                    attribute_value(dietplanner, ${patientCode}, surname, ${patient.surname}).
                    attribute_value(dietplanner, ${patientCode}, age, ${patient.age}).
                    attribute_value(dietplanner, ${patientCode}, gender, ${patient.gender}).
                    attribute_value(dietplanner, ${patientCode}, height, ${patient.height}).
                    attribute_value(dietplanner, ${patientCode}, weight, ${patient.weight}).
                `)
                session.query(`compute_needed_calories(${patientCode}, NeededCalories).`);
                session.answer(a => {
                    setEnergyDemand(parseInt(a.lookup("NeededCalories").value))
                })
            })
        }
    }, [patient])

    return energyDemand
}

export function useGetQuestions(answeredQuestions = []) {

    listLoader(pl)
    let session = pl.create();
    let [nextQuestionId, setNextQuestionId] = useState()
    let [nextQuestion, setNextQuestion] = useState()
    let [nextAnswers, setNextAnswers] = useState([])

    useEffect(() => {
        let oldQuestions = []
        answeredQuestions.map(aq => {
            oldQuestions.push(`${aq.questionId}-${aq.answerId}`)
        })
        consultUtilitiesQuestionnaire(session).then(() => {
            const query = `get_next_question(
                ${oldQuestions.length === 0 ? "[]" : `[${oldQuestions.toString()}]`}, 
                ${answeredQuestions.length === 0 ? "q0" : `${answeredQuestions[answeredQuestions.length - 1].questionId}`}, 
                ${answeredQuestions.length === 0 ? "a0" : `${answeredQuestions[answeredQuestions.length - 1].answerId}`}, 
                NextQuestionId, NextQuestion, NextAnswers).`
            session.query(query);
            session.answer(a => {
                try {
                    setNextQuestionId(a.lookup("NextQuestionId").id)
                    setNextQuestion(a.lookup("NextQuestion").id)
                    let answers = []
                    fromList(a.lookup("NextAnswers")).map(ans => {
                        answers.push({
                            id: ans.args[0].id,
                            value: ans.args[1].id
                        })
                    })
                    setNextAnswers(answers)
                } catch (e) {
                    setNextQuestionId(null)
                    setNextQuestion(null)
                    setNextAnswers(null)
                }

            })
        })
    }, [answeredQuestions])

    return {
        newQuestion: nextQuestion,
        newAnswers: nextAnswers,
        newQuestionId: nextQuestionId
    }
}

export function useGetSuggestedDietTypes(answeredQuestions, inferenceMethod) {

    listLoader(pl)
    let session = pl.create();
    let [suggestedTypes, setSuggestedTypes] = useState([])

    useEffect(() => {
        if(inferenceMethod && answeredQuestions.length > 0) {
            let userId = "user_id"
            consultUtilitiesQuestionnaireRulesInferenceEngine(session).then(() => {
                answeredQuestions.map(a => {
                    session.query(`has_answered(${userId}, ${a.questionId}, ${a.answerId}).`)
                    session.answer(a => a.id === "throw" && console.error("has_answered", a))
                })

                if(inferenceMethod === INFERENCE_METHODS.forward) session.query("forward_chaining.")
                else session.query(`backward_chaining(suggested_diet_type(${userId}, DietType)).`)
                session.answer(a => a.id === "throw" && console.error("chaining", a))

                session.query(`get_suggested_diet_type(${userId}, SuggestedTypes).`)
                session.answer(a => {
                    try {
                        setSuggestedTypes(fromList(a.lookup("SuggestedTypes")).map(t => t.id))
                    } catch (e) {
                        console.error("get_suggested_diet_type", a)
                    }
                })
            })
        } else setSuggestedTypes([])
    }, [answeredQuestions, inferenceMethod])

    return suggestedTypes
}

export function useGetAllDietTypes() {

    listLoader(pl)
    let session = pl.create();
    let [dietTypes, setDietTypes] = useState([])

    useEffect(() => {
        consultUtilitiesQuestionnaire(session).then(() => {
            session.query("collect_inference_goals(X).")
            session.answer(a => {
                let newDietTypes = []
                fromList(a.lookup("X")).map(ig => {
                    newDietTypes.push({
                        id: ig.args[0].id,
                        value: ig.args[1].id
                    })
                })
                setDietTypes(newDietTypes)
            })
        })
    },[])

    return dietTypes
}