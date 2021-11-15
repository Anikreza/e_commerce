import React from 'react';
import { BrowserRouter as Router,Switch, Route, useHistory} from 'react-router-dom';
import Header from '../components/Header'

function Example() {
    return (
        <div>
            <Router>
                <Header/>
            </Router>
        </div>
    );
}

export default Example;

