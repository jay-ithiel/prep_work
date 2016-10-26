import React from 'react';
import TodoListItem from './todo_list_item';

class TodoList extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.handleRequest();
  }

  render() {

    return (
      <ul>
        <TodoListItem props={this.props}/>
      </ul>
    );
  }

}

export default TodoList;
