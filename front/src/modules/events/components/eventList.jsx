import React from 'react';
import {
  Datagrid,
  DateField,
  EditButton,
  List,
  Pagination,
  TextField,
} from 'react-admin';
import { ITEMS_PER_PAGE } from '../../../config';

const EventPagination = (props) => (
  <Pagination rowsPerPageOptions={[ITEMS_PER_PAGE]} {...props} />
);

const EventList = (props) => (
  <List {...props} pagination={<EventPagination />}>
    <Datagrid>
      <TextField source='id' sortable={false} />
      <TextField source='title' sortable={false} />
      <DateField source='date_start' sortable={false} />
      <DateField source='date_end' sortable={false} />
      <EditButton basePath='/events' />
    </Datagrid>
  </List>
);

export default EventList;
