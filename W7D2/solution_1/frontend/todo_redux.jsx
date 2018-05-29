import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// function addLoggingToDispatch(store){
//   let dis = store.dispatch
//   return (action) => {
//     console.log("Old state");
//     console.log(store.getState());
//     console.log("Action");
//     console.log(action);
//     dis(action);
//     console.log("New state")
//     console.log(store.getState())
//   }
// }

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store); 
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
