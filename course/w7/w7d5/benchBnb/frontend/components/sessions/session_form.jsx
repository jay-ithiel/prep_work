import React from 'react';
import ReactDOM from 'react-dom';
import { Link } from 'react-router';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.processForm(this.state);
  }

  handleChange(e) {
    e.preventDefault();
    this.state.username = e.target.value;
  }

  render() {
    const sessionFormHeader = this.props.formType === 'login' ? "login" : "signup";

    let toggleSessionForm, toggleSessionFormPath;
    if (this.props.location.pathname === '/login') {
      toggleSessionForm = "Sign Up";
      toggleSessionFormPath = '/signup';
    } else {
      toggleSessionForm = "Log In";
      toggleSessionFormPath = "/login";
    }

    const errors = this.props.errors;
    let errorsLi;
    if (errors) {
      errorsLi = errors.map(error => (
        <li>error</li>
      ));
    }

    // if (this.props.currentUser) { }

    return(
      <div className="session-form">
        <h1 className="session-form-header">{sessionFormHeader}</h1>
        <input
          type="text"
          name="username"
          onChange={this.handleChange} />
        <input
          type="text"
          name="password"
          onChange={this.handleChange} />
        <button onClick={this.handleSubmit}>Submit</button>
        <Link to={toggleSessionFormPath}>{toggleSessionForm}</Link>
        <ul>{errorsLi}</ul>
      </div>
    );
  }
}

export default SessionForm;
