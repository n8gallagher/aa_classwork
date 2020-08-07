import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";

const initialState = {
    1: {
      id: 1,
      title: "wash car",
      body: "with soap",
      done: false
    },
    2: {
      id: 2,
      title: "wash dog",
      body: "with shampoo",
      done: true
    }
  };

const todosReducer = (prevState = initialState, action) => {
    Object.freeze(prevState);
    let nextState = { ...prevState };

    switch(action.type) {
        case RECEIVE_TODOS: 
        //changed this to blank state such that 
        //state is overwritten by new state
            let blankState = {};
            action.todos.forEach(todo => {
                blankState[todo.id] = todo; 
            });
            return blankState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState;
        default: 
            return prevState; 
    }
}

export default todosReducer; 