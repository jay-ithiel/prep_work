import React from 'react';
import { NOTE_NAMES, TONES } from './../../util/tones';


const NoteKey = ({note, index}) => {
  return (<div> {NOTE_NAMES[index]} </div>);
};

export default NoteKey;
