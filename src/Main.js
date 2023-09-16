import {useState} from "react";
import FilterBarAsCard from "./components/FilterBarAsCard";
import Patient from "./containers/Patient";

export default function Main(){
    const [filter, setFilter] = useState(0);
    const filters = [
        {
            id: 0,
            name: "PATIENCE PROFILE",
            component: <Patient/>
        }
    ]

    return <div style={{position: "absolute", left: "50%", marginLeft: "-25em", width: "50em"}}>
        <FilterBarAsCard
            filters={filters}
            onFilter={(filterId) => setFilter(filterId)}
            selected={filter}
        >
            {filters.find(f => f.id === filter)?.component ?? <></>}
        </FilterBarAsCard>
    </div>
}