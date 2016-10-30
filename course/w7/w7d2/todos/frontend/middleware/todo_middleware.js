import {
  REQUEST_TODOS,
  RECEIVE_TODOS
} from '../actions/todo_actions';

const TodoMiddleWare = store => next => action => {
  switch(action.type) {
    case REQUEST_TODOS:
      console.log('here is where todos will be fetched');
      break;

    case RECEIVE_TODOS:
      return;
      
    default:
      next(action);
  }
};

export default TodoMiddleWare;
