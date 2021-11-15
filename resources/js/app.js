import Index from "./components/Index";
require('./components/Index');
import ReactDOM from 'react-dom'
import '../sass/app.scss'
import reducer, {initialState} from '../js/reducer';
import {StateProvider} from '../js/StateProvider';
import React from 'react';

if (document.getElementById('app')) {
    ReactDOM.render(
        <React.StrictMode>
            <StateProvider initialState={initialState} reducer={reducer}>
                <Index/>
            </StateProvider>
        </React.StrictMode>,
        document.getElementById('app')
    );
}
