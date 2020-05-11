// tmp code
import React from 'react';
import { render } from 'react-dom';
import { Admin, Resource } from 'react-admin';
//import simpleRestProvider from 'ra-data-json-server';
import simpleRestProvider from './railsProvider';
// import { restClient } from './restClient';

import { EventList, EventEdit, EventCreate, EventIcon } from './events';

render(
    <Admin dataProvider={simpleRestProvider('http://localhost:3001')}>
        <Resource name="events" list={EventList} edit={EventEdit} create={EventCreate} icon={EventIcon}/>
    </Admin>,
    document.getElementById('root')
);