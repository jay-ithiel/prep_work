import {
  LOGIN,
  LOGOUT,
  SIGNUP,
  receiveCurrentUser,
  receiveErrors
} from '../actions/session_actions';

import { login, signup, logout } from '../util/session_api_util';

const SessionMiddleware = ({ dispatch }) => next => action => {
  const loginSuccess = user => dispatch(receiveCurrentUser(user));
  const errorCallback = errors => dispatch(receiveErrors(errors));

  switch(action.type) {
    case LOGIN:
      login(action.user, loginSuccess, errorCallback);
      return next(action);

    case LOGOUT:
      logout(() => next(action));
      break;

    case SIGNUP:
      signup(action.user, loginSuccess, errorCallback);
      return next(action);

    default:
      return next(action);
  }


};

export default SessionMiddleware;
