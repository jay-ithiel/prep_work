import merge from 'lodash/merge';
import {
  RECEIVE_CURRENT_USER,
  RECEIVE_ERRORS,
  LOGOUT
} from '../actions/session_actions';


const _defaultState = {
  currentUser: null,
  errors: []
};

const SessionReducer = (state = _defaultState, action) => {
  Object.freeze(state);
  let newState = merge({}, state);

  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      newState.currentUser = action.currentUser;
      return newState;

    case RECEIVE_ERRORS:
      newState.currentUser = null;
      newState.errors = action.errors;
      return newState;

    case LOGOUT:
      // newState.currentUser = null;
      // newState.errors = [];
      // return newState;
      return _defaultState;
      
    default:
      return state;
  }
};

export default SessionReducer;
