import React from 'react';
import ChannelList from '../containers/channel_list';
import MessageList from '../containers/message_list';

import source from "../../../assets/images/logo.png";

const App = (props) => {
  return (
    <div className="messaging-wrapper">
      <div className="logo-container">
        <img className="messaging-logo" src={source} alt="logo" />
      </div>
      <ChannelList selectedChannel={props.match.params.channel} />
      <MessageList selectedChannel={props.match.params.channel} />
    </div>
  );
};

export default App;
