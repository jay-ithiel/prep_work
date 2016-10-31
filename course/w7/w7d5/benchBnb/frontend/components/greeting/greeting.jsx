import React from 'react';
import { Link } from 'react-router';

const sessionLinks = () => (
  <nav className="login-signup">
    <Link to="/login">Login</Link>
    <br></br>
    <Link to="/signup">Sign Up</Link>
  </nav>
);

const userWelcome = (currentUser, logout) => (
  <div className="user-welcome">
    <h2 className="user-name">{currentUser.username}</h2>
    <button className="user-logout" onClick={logout}>Log Out</button>
  </div>
);

const Greeting = (props) => (
  props.currentUser ? userWelcome(props.currentUser, props.logout) : sessionLinks()
);

export default Greeting;
