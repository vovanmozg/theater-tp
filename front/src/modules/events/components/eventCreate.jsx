import React from 'react';
import {
  Create,
  DateInput,
  SimpleForm,
  TextInput,
} from 'react-admin';


const EventCreate = (props) => (
  <Create title='Create a Event' {...props}>
    <SimpleForm>
      <TextInput source='title' />
      <TextInput multiline source='description' />
      <DateInput label='Start date' source='date_start' />
      <DateInput label='End date' source='date_end' />
    </SimpleForm>
  </Create>
);

export default EventCreate;
