var React = require('react');
var request = require('superagent');
var Form = require('./Form.react');
var List = require('./List.react');
var Cashflow = require('./Cashflow.react');

var Expenses = React.createClass( {
  getInitialState: function() {
    return {
      expenses: []
    };
  },

  componentWillMount: function() {
    this._retrieveExpenses();
  },

  render: function() {
    return (
      <div className="container">
        <Form createExpense={this._createExpense} />
        <div className="cashflow">
          <List expenses={this.state.expenses} updateExpense={this._updateExpense} removeExpense={this._removeExpense} />
          <Cashflow expenses={this.state.expenses}/>
        </div>
      </div>
    )
  },

  _retrieveExpenses: function() {
    request
      .get('/expenses')
      .set('Accept', 'application/json')
      .end(this._handleRetrieve)
  },

  _createExpense: function(data) {
    request
      .post('/expenses')
      .send(data)
      .set('Accept', 'application/json')
      .set('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content)
      .end(this._handleChange)
  },

  _updateExpense: function(data) {
    request
      .patch('/expenses/' + data.id)
      .send(data)
      .set('Accept', 'application/json')
      .set('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content)
      .end(this._handleChange);
  },

  _removeExpense: function(id) {
    request
      .del('/expenses/' + id)
      .set('Accept', 'application/json')
      .set('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content)
      .end(this._handleChange);
  },

  _handleRetrieve: function(err, res) {
    if (err) {
      window.alert('No Data Retrieved');
      return;
    }
    this.setState({ expenses: res.body });
  },

  _handleChange: function(err, res) {
    if (err) {
      window.alert('No Data Saved');
      return;
    }
    this._retrieveExpenses();
  }

});

module.exports = Expenses;
