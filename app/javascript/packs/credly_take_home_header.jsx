// Run this example by adding <%= javascript_pack_tag 'credly_take_home_header' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <h1>Credly Take-home</div> on the page

import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';

const CredlyTakeHomeHeader = props => (
  <h1> { props.headerText }</h1>
);

CredlyTakeHomeHeader.defaultProps = {
  headerText: 'Credly Take-home'
};

CredlyTakeHomeHeader.propTypes = {
  name: PropTypes.string
};

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <CredlyTakeHomeHeader />,
    document.body
  );
});
