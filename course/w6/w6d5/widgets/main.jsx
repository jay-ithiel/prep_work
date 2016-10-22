import React from 'react';
import ReactDOM from 'react-dom';

import Tab from './tabs/tab';
import Clock from './weather_clock/clock';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("tabs-go-here");
  const tabs = [
    {title: "first Tab", content: "first content"},
    {title: "second tab", content: "second content"},
    {title: "third tab", content: "third"}
  ];
  ReactDOM.render(<Tab tabs={tabs}/>, root);

  const clockRoot = document.getElementById("clock-go-here");
  ReactDOM.render(<Clock/>, clockRoot);


});

// import Tab from './tab'
// <Tab prop1={value} prop2={value}/>
// const tabs = [{title: "tab 1", content: "bpody of tab1"}. {}...]
