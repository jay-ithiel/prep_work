import React from 'react';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestTodos();
  }

  render() {
    let todoTitles = this.props.todos.map((todo, i) => (
      <li key={i}>{todo.title}</li>
    ));

    return(
      <ul>{todoTitles}</ul>
    );
  }
}

export default TodoList;
