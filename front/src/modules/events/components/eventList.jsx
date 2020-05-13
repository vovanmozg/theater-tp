import React from 'react';
import {
  Datagrid,
  DateField,
  EditButton,
  List,
  Pagination,
  TextField,
} from 'react-admin';

const EventPagination = props => <Pagination rowsPerPageOptions={[10]} {...props} />;

const EventList = (props) => (
  <List {...props} pagination={<EventPagination />}>
    <Datagrid>
      <TextField source='id' sortable={false}/>
      <TextField source='title' sortable={false} />
      <DateField source='date_start' sortable={false} />
      <DateField source='date_end' sortable={false} />
      <EditButton basePath='/events' />
    </Datagrid>
  </List>
);

export default EventList;