import React from 'react';
import PropTypes from 'prop-types';

const EventTitle = ({ record }) => (
  <span>
    Event
    {record ? `'${record.title}'` : ''}
  </span>
);

EventTitle.propTypes = {
  record: PropTypes.shape({ title: PropTypes.string.isRequired }).isRequired,
};

export default EventTitle;
