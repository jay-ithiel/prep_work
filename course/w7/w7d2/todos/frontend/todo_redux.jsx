import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

document.addEventListener("DOMContentLoaded", () => {
  const rootContent = document.getElementById("content");
  const store = configureStore();

  ReactDOM.render(<h1>Todos App</h1>, rootContent);

  window.store = store;
});
