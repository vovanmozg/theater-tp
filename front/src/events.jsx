// tmp code
// in posts.js
import React from 'react';
import { Pagination, List, Datagrid, Edit, Create, SimpleForm, DateField, TextField, EditButton, TextInput, DateInput } from 'react-admin';
import BookIcon from '@material-ui/icons/Book';
export const EventIcon = BookIcon;

const PostPagination = props => <Pagination rowsPerPageOptions={[10]} {...props} />;

export const EventList = (props) => (
    <List {...props} pagination={<PostPagination />}>
        <Datagrid>
            <TextField source="id" />
            <TextField source="title" />
            <DateField source="date_start" />
            <DateField source="date_end" />
            <EditButton basePath="/events" />
        </Datagrid>
    </List>
);

const EventTitle = ({ record }) => {
    return <span>Event {record ? `"${record.title}"` : ''}</span>;
};

export const EventEdit = (props) => (
    <Edit title={<EventTitle />} {...props}>
        <SimpleForm>
            <TextInput disabled source="id" />
            <TextInput source="title" />
            <TextInput multiline source="description" />
            <DateInput label="Start date" source="date_start" />
            <DateInput label="End date" source="date_end" />
        </SimpleForm>
    </Edit>
);

export const EventCreate = (props) => (
    <Create title="Create a Event" {...props}>
        <SimpleForm>
            <TextInput source="title" />
            <TextInput multiline source="description" />
            <DateInput label="Start date" source="date_start" />
            <DateInput label="End date" source="date_end" />
        </SimpleForm>
    </Create>
);