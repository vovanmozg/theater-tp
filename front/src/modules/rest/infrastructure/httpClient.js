// Fetches json from server process response and format errors
import { HttpError } from 'react-admin';

const httpClient = (url, options = {}) => {
  const requestHeaders = options.headers
    || new Headers({
      Accept: 'application/json',
      'Content-Type': 'application/json',
    });

  return fetch(url, { ...options, headers: requestHeaders })
    .then((response) => response.text().then((text) => ({
      status: response.status,
      statusText: response.statusText,
      headers: response.headers,
      body: text,
    })))
    .then(({
      status, statusText, headers, body,
    }) => {
      let json;
      try {
        json = JSON.parse(body);
      } catch (e) {
        // not json, no big deal
      }
      if (status < 200 || status >= 300) {
        // const errorMessage = (json && 'error' in json) ? `errors.${json.error}` : false;
        const errorMessage = Object.keys(json)
          .map((objectKey) => `${objectKey}: ${json[objectKey]}`)
          .join('; ');

        return Promise.reject(
          new HttpError(errorMessage || statusText, status),
        );
      }
      return {
        status,
        headers,
        body,
        json,
      };
    });
};

export default httpClient;
