// import HttpError from 'admin-on-rest/lib/utils/HttpError';

const fetchJson = (url, options = {}) => {
  const requestHeaders = options.headers || new Headers({
    Accept: 'application/json',
  });
  // if (!(options && options.body && options.body instanceof FormData)) {
     requestHeaders.set('Content-Type', 'application/json');
  // }

  return fetch(url, { ...options, headers: requestHeaders })
    .then(response => {
        return response.text().then(text => ({
        status: response.status,
        statusText: response.statusText,
        headers: response.headers,
        body: text,
      }))

    }
    )
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
        const errorMessage = (json && 'error' in json) ? `errors.${json.error}` : false;
        //return Promise.reject(new HttpError(errorMessage || statusText, status));
        return Promise.reject();
      }
      return {
        status, headers, body, json,
      };
    });
};

export default fetchJson;
