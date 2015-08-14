var React = require('react');
var Expenses = require('./expenses/Expenses.react.js');
var Users = require('./users/Users.react.js');

var components = function() {
  var expensesSelector = document.querySelector('[data-js="expenses"]');
  var usersSelector = document.querySelector('[data-js="users"]');
    if (expensesSelector) {
      React.render(<Expenses />, expensesSelector)
    }
    if (usersSelector) {
      React.render(<Users />, usersSelector)
    }
};

module.exports = components;
