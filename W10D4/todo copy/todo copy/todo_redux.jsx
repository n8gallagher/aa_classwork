// import React from 'react';

// const Congrats = () => <h1>Congratulations, you did it!</h1>;

// export default Congrats;


import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import App from './frontend/components/app';
import Root from './frontend/components/root';
// import Congrats from './congrats';

//imported actions 
import { receiveTodos, receiveTodo } from './frontend/actions/todo_actions';
import allTodos from './frontend/reducers/selectors';

//added actions to window so that we can access them 

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    // ReactDOM.render(<h1>Todos App</h1>, root);
    let store = configureStore(); 
    ReactDOM.render(<Root store={store}/>, root);
    //define store to be called configureStore 
    window.receiveTodos = receiveTodos; 
    window.receiveTodo = receiveTodo; 
    window.store = store;
    window.allTodos = allTodos;
});


