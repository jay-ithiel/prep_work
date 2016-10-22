import React from 'react';

class Clock extends React.Component {
  constructor() {
    this.state = {dateTime: new Date()};
    this.handle = 0;
  }

  componentDidMount() {
    this.handle = setInterval(() => {
      this.setState({time: new Date()});
    }, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.handle);
  }

  render(){
    return (
      <div className="clocktime">
        <div className="Time">
          <h1>Time</h1>
          <h2>{this.state.dateTime.toTimeString()}</h2>
        </div>
        <div className="Clock">
          <h1>Clock</h1>
          <h2>{this.state.dateTime.toDateString()}</h2>
        </div>
      </div>
    );
  }
}
