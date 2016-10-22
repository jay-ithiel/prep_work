import React from 'react';

class Tab extends React.Component {
  constructor(props) {
    super(props);
    this.state = { index: 'first Tab'};
  }

  handleClick(index) {
    this.setState({index});
  }


  render() {


    return (
      <div>
        <ul>
          {this.props.tabs.map((tabObj) =>
            <div key={tabObj.title}
              onClick={this.handleClick.bind(this, tabObj.title)}>
              <li className={this.state.index === tabObj.title ? "active" : ""}>
                <h1 className="tab" >{tabObj.title}</h1>
              </li>
            </div>
          )}
        </ul>

        {this.props.tabs.map((tabObj) =>
          <div key={tabObj.title} className="content">
            <article className={this.state.index === tabObj.title ? "active" : ""}>
              {tabObj.content}</article>
          </div>
        )}
      </div>
    );
  }
}

export default Tab;

// return (event => this.setState({ ["index"]: event.currentTarget.title }));

// {console.log(tabObj.index)}

// {this.props.tabs.map(tabObj => tabObj.title )}
