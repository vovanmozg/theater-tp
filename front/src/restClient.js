//import jsonServerProvider from 'ra-data-json-server';
import jsonServerProvider from './railsProvider';
import fetchJson from './utils/fetchJson';

// const httpClient = (url, options = {}) => {
//   if (!options.headers) {
//     options.headers = new Headers({ Accept: 'application/json' });
//   }
//
//   return fetchJson(url, options);
// };


const httpClient = (url, options = {}) => {
  if (!options.headers) {
    options.headers = new Headers({ Accept: 'application/json' });
  }
  //options.headers.set('authorization', localStorage.getItem('authToken'));
  console.log('options', options)
  return fetchJson(url, options);
};

export default jsonServerProvider(`http://localhost:3001`, httpClient);
//export const simpleRestClient = jsonServerProvider(`http://localhost:3001`, httpClient);