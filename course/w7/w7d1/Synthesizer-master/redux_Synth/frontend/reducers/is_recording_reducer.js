import { START_RECORDING, STOP_RECORDING, ADD_NOTES } from '../actions/tracks_actions.js';
import { startRecording, stopRecording, addNotes } from '../actions/tracks_actions.js';

export const isRecordingReducer = (state = false, action) => {
  Object.freeze(state);
  switch (action.type) {
    case START_RECORDING:
      return true;
    case STOP_RECORDING:
      return false;
    default:
      return state;
  }
};


export default isRecordingReducer;
