

const allTodos = (state) => {
    return Object.keys(state.todos).map(todoId => {
       let id = parseInt(todoId)
        return state[id];
    });
}

export default allTodos;