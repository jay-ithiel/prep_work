import React from 'react';
import { NOTE_NAMES, TONES } from './../../util/tones';
import Note from './../../util/note';
import $ from 'jquery';
import NoteKey from './note_key';

class Synth extends React.Component {
  constructor(props) {
    super(props);
    this.notes = this.constructorHelper();
  }

  constructorHelper() {
    let notes = NOTE_NAMES.map(note => {
      let tone = TONES[note];
      return { note: new Note(tone) };
    });
    return notes;
  }


  onKeyDown(e) {
    let key = e.key;
    this.props.keyPressed(key);
  }

  onKeyUp(e) {
    let key = e.key;
    this.props.keyReleased(key);
  }

  componentDidMount() {
    $(document).on('keydown', e => this.onKeyDown(e));
    $(document).on('keyup', e => this.onKeyUp(e));
  }

  playNotes() {
    this.notes.forEach((note, index) => {
      if (this.props.notes.includes(NOTE_NAMES[index])) {
        note.note.start();
      } else {
        note.note.stop();
      }
    });
  }


  render() {
    this.playNotes();

    let notes = this.notes.map((obj, index) => {
      return ( <li key={index}> <NoteKey note={obj.note} index= {index}/> </li>);
    });


    return(
      <div>
        <ul>{notes}</ul>
      </div>
    );
  }
}

export default Synth;
