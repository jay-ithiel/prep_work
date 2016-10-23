import React from 'react';
import ReactDOM from 'react-dom';

import Tabs from './tabs';

const Panes = [
  { title: 'Tab 1', content: "Content 1" },
  { title: 'Tab 2', content: "Content 2" },
  { title: 'Tab 3', content: "Content 3" },
];

class Root extends React.Component {
  render() {
    return(
      <div>
        <Tabs tabs={Panes}/>
      </div>
    );
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);
});
