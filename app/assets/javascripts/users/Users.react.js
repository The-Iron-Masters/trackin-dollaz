var React   = require('react');
var request = require('superagent');

var Login = React.createClass({

  getInitialState: function() {

      if (document.querySelector('[data-login="login"]') != null) {
        return {
          auth: false
        }
      } else if (document.querySelector('[data-login="welcome"]') != null) {
        return {
          auth: true
        }
      }
  },

  componentDidMount: function(){
    switch (this.state.auth) {
      case true:
        return
      case false:
          var token = document.querySelector('meta[name="csrf-token"]').content;
          this.refs.token.getDOMNode().value = token;
    }
  },

  render: function(){

    switch (this.state.auth) {
      case false:
      return (
          <form action="/login" method="post">
            <div>
            <input ref="token" type="hidden" name="authenticity_token" />
            </div>
            <div>
              <label htmlFor="email">Email: </label>
              <input ref="email" id="email" name="user[email]" />
            </div>
            <div>
              <label htmlFor="password">Password: </label>
              <input type="password" ref="password" id="password" name="user[password]" />
            </div>
            <div>
              <button>Submit</button>
            </div>
          </form>
      );
      case true:
        return (
          <div>
            <p>You are logged in</p>
          </div>
        );
    }
  }

});

module.exports = Login;
