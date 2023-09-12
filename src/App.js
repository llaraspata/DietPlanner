import {useState} from "react";
import FilterBarAsCard from "./components/FilterBarAsCard";
import Patient from "./containers/Patient";

const pl = require('tau-prolog');

export default function App() {

    const [filter, setFilter] = useState(0);

    let session = pl.create();

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

    session.query("X = [1,2,3].");
    session.answer(a => console.log(fromList(a.lookup("X")))); // [ {...}, {...}, {...} ]


    const filters = [
        {
            id: 0,
            name: "Profilo Paziente",
            component: <Patient/>
        }
    ]
      
    return <div style={{position: "fixed", left: "50%", "margin-left": "-25em", width: "50em"}}>
        <FilterBarAsCard
            filters={filters}
            onFilter={(filterId) => setFilter(filterId)}
            selected={filter}
        >
            {filters.find(f => f.id === filter)?.component ?? <></>}
        </FilterBarAsCard>
    </div>
}
