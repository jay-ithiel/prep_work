import React from 'react';

class TodoListItem extends React.Component {

  render() {
    let todos = this.props.todos.map((todo, index) => {
      debugger
      return(
        <li key={index}>{todo.title}</li>
      );
    });
    return todos;
  }
}


export default TodoListItem;
