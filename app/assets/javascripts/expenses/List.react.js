var React = require('react');
var Expense = require('./Item.react');

var List = React.createClass({
  render: function(){
    return (
      <div className="transaction__list">
        <div>
        <h2>Income</h2>
          <table className="inner__list">
            <tr>
              <th>Name</th>
              <th>Amount</th>
              <th>Date</th>
            </tr>
            {this._buildIncomes()}
          </table>
        </div>
        <div>
        <h2>Expenses</h2>
          <table className="inner__list">
            <tr>
              <th>Name</th>
              <th>Amount</th>
              <th>Date</th>
            </tr>
            {this._buildExpenses()}
          </table>
        </div>
      </div>
    );
  },

  _buildExpenses: function() {
     return this.props.expenses.map(function(expense) {
      if (expense.transaction_type === "expense") {
        return <Expense data={expense} updateExpense={this.props.updateExpense} removeExpense={this.props.removeExpense} key={expense.name + expense.id} />
      }
    }.bind(this));
  },

  _buildIncomes: function() {
     return this.props.expenses.map(function(income) {
      if (income.transaction_type === "income") {
        return <Expense data={income} updateExpense={this.props.updateExpense} removeExpense={this.props.removeExpense} key={income.name + income.id} />
      }
    }.bind(this));
  }

});

module.exports = List;
