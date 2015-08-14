var React = require('react');

var Form = React.createClass({

  render: function() {
    return (
      <form onSubmit={this._handleSubmit}>
        <ul className="expense__form">
          <li className="form__item">
            <label htmlFor="name"> Transaction Name: </label>
            <input ref="name" id="name" />
          </li>
          <li className="form__item">
            <label htmlFor="amount"> Transaction Amount: </label>
            <input ref="amount" id="amount" />
          </li>
          <li className="form__item">
            <label htmlFor="transaction_type"> Transaction Type: </label>
            <select ref="transactionType" id="transaction_type">
              <option value="income">Income</option>
              <option value="expense">Expense</option>
            </select>
          </li>
          <li className="form__item">
            <label htmlFor="transaction_date"> Transaction Date: </label>
            <input ref="transactionDate" placeholder="YYYY-MM-DD" id="transaction_date" />
          </li>
          <li className="form__item">
            <button>Submit</button>
          </li>
        </ul>
      </form>
    );
  },

  _handleSubmit: function(e) {
    e.preventDefault();
    var data = {
      expense: {
        name: this.refs.name.getDOMNode().value.trim(),
        amount: this.refs.amount.getDOMNode().value.trim(),
        transaction_type: this.refs.transactionType.getDOMNode().value,
        transaction_date: this.refs.transactionDate.getDOMNode().value.trim()
      }
    };
    this.props.createExpense(data);
    React.findDOMNode(this.refs.name).value = '';
    React.findDOMNode(this.refs.amount).value = '';
    React.findDOMNode(this.refs.transactionDate).value = '';
  }

});

module.exports = Form;
