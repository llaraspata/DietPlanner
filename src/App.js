const pl = require('tau-prolog');

export default function App() {

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
      
    return <div>Hello World!</div>
}
