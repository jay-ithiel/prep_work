export const allTodos = state => {
  let todoKeys = Object.keys(state.todos);
  return todoKeys.map(todoId => (state.todos[todoId]));
};
