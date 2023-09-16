import {useEffect,useState} from "react";
import functions from '../prolog/functions.pl'
import instances from '../prolog/instances.pl'


const pl = require('tau-prolog');

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

export function useGetActivityAllergenNames() {

    let session = pl.create();
    let [allergens, setAllergens] = useState([])
    let [activities, setActivities] = useState([])

    useEffect(() => {
        fetch(functions)
            .then((res) => res.text())
            .then((program) => {
                session.consult(program, {
                    success: () => {
                        fetch(instances)
                            .then((res) => res.text())
                            .then((program) => {
                                session.consult(program,{
                                    success : () => {
                                        session.query("collect_allergen_names(Names).");
                                        session.answer(a => {
                                            setAllergens(fromList(a.lookup("Names")).map(t => t.id))
                                            console.log("allergeni presi")
                                        })
                                        session.query("collect_activities_names(Names).");
                                        session.answer(a => {
                                            setActivities(fromList(a.lookup("Names")).map(t => t.id))
                                            console.log("attività prese")
                                        })
                                    },
                                    error: (err) => console.error("error consulting instances", err)
                                })
                            })
                            .catch((e) => console.error("error fetching instances", e));
                    },
                    error: (err) => console.error("error consulting functions", err)
                })
            })
            .catch((e) => console.error("error fetching functions", e));
    }, []);

    return {allergens, activities}
}

//todo per calcolare il fabbisogno calorico usa compute_needed_calories
//crea una cosa come questa
// person_instance(dietplanner, person, nome.toLower_congome.toLower).
// attribute_value(dietplanner, nome.toLower_congome.toLower, name, dato_corretto).
// attribute_value(dietplanner, nome.toLower_congome.toLower, surname, 'Johnson').
// attribute_value(dietplanner, nome.toLower_congome.toLower, age, 30).
// attribute_value(dietplanner, nome.toLower_congome.toLower, gender, 'Female').
// attribute_value(dietplanner, nome.toLower_congome.toLower, height, 165).
// attribute_value(dietplanner, nome.toLower_congome.toLower, weight, 60.5).

//chiama compute_needed_calories(nome.toLower_congome.toLower, NeededCalories).
//NeededCalories sarà popolato con il dato che serve