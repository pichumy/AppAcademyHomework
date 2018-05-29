import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
}

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer,
    preloadedState,

    applyMiddleware(addLoggingToDispatch, sillyMiddleware)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

function applyMiddlewares(store, middlewares){
  dispatch = store.dispatch;
  middleware.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch })
}
export default configureStore;
