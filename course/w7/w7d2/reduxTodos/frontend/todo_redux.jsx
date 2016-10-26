import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import { requestTodos, receiveTodos } from './actions/todo_actions.js';
import { allTodos } from './reducers/selector';
import { Root } from './components/root';


document.addEventListener("DOMContentLoaded", () => {
  const content = document.getElementById("content");
  const store = configureStore();

  ReactDOM.render(<Root store={store}/>, content);

  window.allTodos = allTodos;
  window.requestTodos = requestTodos;
  window.store = store;
});
