import { applyMiddleware } from 'redux';
import TodoMiddleWare from './todo_middleware';

const MasterMiddleware = applyMiddleware(
  TodoMiddleWare
);

export default MasterMiddleware;
