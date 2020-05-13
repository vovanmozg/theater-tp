import React from 'react';
import { Admin, Resource } from 'react-admin';
import simpleRestProvider from '../../rest/infrastructure/railsProvider';
import httpClient from '../../rest/infrastructure/httpClient';

import {
  EventList,
  EventEdit,
  EventCreate,
  EventIcon,
} from '../../events';
import { API_URL } from '../../../config';

const App = () => (
  <Admin dataProvider={simpleRestProvider(API_URL, httpClient)}>
    <Resource name='events' list={ EventList } edit={ EventEdit } create={ EventCreate } icon={ EventIcon }/>
  </Admin>
);

export default App;
