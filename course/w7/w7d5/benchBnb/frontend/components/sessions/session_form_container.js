import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login, signup } from '../../actions/session_actions';


const mapStateToProps = state => ({
  loggedIn: state.session.currentUser ? true : false,
  errors: state.errors
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  formType: ownProps.location.pathname === '/login' ? 'login' : 'signup',
  processForm: (formType) => (
    formType === 'login' ?
      dispatch(login(ownProps.currentUser)) :
      dispatch(signup(ownProps.currentUser))
  )
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
