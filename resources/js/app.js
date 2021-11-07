import Example from "./components/Example";


require('./components/Example');

import ReactDOM from 'react-dom'
import Index from "./components/Example";

if (document.getElementById('app')) {
    ReactDOM.render(<Example />, document.getElementById('app'));
}
