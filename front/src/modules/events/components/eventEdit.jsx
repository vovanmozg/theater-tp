import React from 'react';
import {
  DateInput,
  Edit,
  SimpleForm,
  TextInput,
} from 'react-admin';
import EventTitle from './eventTitle';

const EventEdit = (props) => (
  <Edit title={<EventTitle />} {...props}>
    <SimpleForm>
      <TextInput disabled source='id' />
      <TextInput source='title' />
      <TextInput multiline source='description' />
      <DateInput label='Start date' source='date_start' />
      <DateInput label='End date' source='date_end' />
    </SimpleForm>
  </Edit>
);

export default EventEdit;
