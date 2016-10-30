import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import { requestTodos } from './actions/todo_actions';
import { allTodos } from './reducers/selector';


document.addEventListener("DOMContentLoaded", () => {
  const rootContent = document.getElementById("content");
  const store = configureStore();

  ReactDOM.render(<Root store={store} />, rootContent);

  window.store = store;
  window.allTodos = allTodos;
  window.requestTodos = requestTodos;
});
