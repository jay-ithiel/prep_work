import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { selectedTabIdx: 0 };
    this.currTab = this.currTab.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  currTab() {
    return this.state.selectedTabIdx;
  }

  handleClick(e) {
    let newTabIdx = parseInt(e.currentTarget.id);
    this.setState({ selectedTabIdx: newTabIdx });
  }

  render() {
    const titles = this.props.tabs.map((tab, index) => {
      return(
        <li
          key={ index }
          id={ index }
          className={ index === this.currTab() ? "active-title" : "" }
          onClick={ this.handleClick }>
          { tab.title }
        </li>
      );
    });

    const contents = this.props.tabs.map((tab, index) => {
      return(
        <div
          key={ index }
          className={ index === this.currTab() ? "active-content" : "" }>
          { tab.content }
        </div>
      );
    });

    return(
      <div className="tabs-window">
        <ul className="titles">
          { titles }
        </ul>
        <article className="contents">
          { contents }
        </article>
      </div>
    );
  }
}

export default Tabs;
