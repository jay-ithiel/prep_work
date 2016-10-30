import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, root);
});
<<<<<<< HEAD
=======


// On Greeting components
>>>>>>> 48ff51b0b6db9031bfe49930d6539e49347369bb
