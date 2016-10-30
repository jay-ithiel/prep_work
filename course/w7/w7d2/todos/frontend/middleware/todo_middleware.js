import { fetchTodos } from '../util/todo_api_util';

import {
  REQUEST_TODOS,
  RECEIVE_TODOS, receiveTodos
} from '../actions/todo_actions';

const TodoMiddleWare = ({ dispatch }) => next => action => {
  const successCallback = data => dispatch(receiveTodos(data));
  const errorCallback = data => console.log("error", data);

  switch(action.type) {
    case REQUEST_TODOS:
      fetchTodos(successCallback, errorCallback);
      return next(action);

    default:
      next(action);
  }
};

export default TodoMiddleWare;
