import { REQUEST_TODOS, RECEIVE_TODOS, requestTodos, receiveTodos } from '../actions/todo_actions';
import { fetchTodos } from '../util/todo_api_util';

const middleware = ({ getState, dispatch }) => next => action => {
  let result = next(action);

  switch (action.type) {
    case REQUEST_TODOS:
      console.log("todos would be fetched");
      const success = data => dispatch(receiveTodos(data));
      const error = e => console.log(e);
      fetchTodos(success, error);
      break;
    default:
      return result;
  }
};

export default middleware;
