import React from 'react';
import ReactDOM from 'react-dom';
import Game from './componenets/game.jsx';

document.addEventListener("DOMContentLoaded", () => {
    ReactDOM.render(<Game size={4} />, document.getElementById("root"));

})