import React from 'react';

const EventTitle = ({ record }) => {
  return <span>
    Event {record ? `'${record.title}'` : ''}
  </span>;
};

export default EventTitle;
