import { KEY_PRESSED, KEY_RELEASED } from '../actions/notes_actions';
import { NOTE_NAMES } from '../util/tones';

import merge from 'lodash/merge';

const _defaultState = {
  notes: [],
  isRecording: false,
  tracks: {}
};

export const notesReducer = (state = _defaultState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case KEY_PRESSED:
      if (!state.includes(action.key) && NOTE_NAMES.includes(action.key)) {
        return [...state, action.key];
      }
      return state;

    case KEY_RELEASED:
      if (state.includes(action.key) && NOTE_NAMES.includes(action.key)) {
        let index = state.indexOf(action.key);
        let arr1 = state.slice(0, index);
        let arr2 = state.slice(index + 1);
        return arr1.concat(arr2);
      }
      return state;

    default:
      return state;
  }

};
