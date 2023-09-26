import {useEffect,useState} from "react";
import functions from '../prolog/functions.pl'
import instances from '../prolog/instances.pl'

import utilities from "../prolog/diet_type/utilities.pl"
import questionnaire from "../prolog/diet_type/questionnaire.pl"


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

export async function consultFunctionsInstances(session){
    const functionsCode = await fetch(functions).then((res) => res.text()).then((program) => program)
    const instancesCode = await fetch(instances).then((res) => res.text()).then((program) => program)
    session.consult(functionsCode);
    session.consult(instancesCode);
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

export function useGetFirstQuestion() {

    listLoader(pl)
    let session = pl.create();

    useEffect(() => {
        fetch(utilities).then((res) => res.text()).then((utilitiesProgram) => {
            fetch(questionnaire).then((res) => res.text()).then((questionnaireProgram) => {
                session.consult(utilitiesProgram);
                session.consult(questionnaireProgram);
                console.log("programs consulted")
                session.query("get_next_question([], q0, a0, NextQuestionId, NextQuestion, NextAnswers).");
                session.answer(a => console.log(a))
            })
        })
    }, [])
}