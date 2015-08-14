var React = require('react');

var Cashflow = React.createClass({
  render: function(){
    var expenses = this._transaction("expense");
    var incomes = this._transaction("income");
    return (
      <div className="totals">
        <h2>Summary</h2>
        <div className="total_income">
          <h3>Income</h3>
          {incomes}
        </div>
        <div className="total_expenses">
          <h3>Expenses</h3>
          {expenses}
        </div>
        <div className="total_cashflow">
          <h3>Cashflow</h3>
          {this._subtract(incomes, expenses)}
        </div>
      </div>
  );
  },

  _transaction: function(type){
    console.log("running transactions")
    var transactions = [];
    this.props.expenses.forEach(function(item, index, arr) {
      if (item.transaction_type === type) {
        transactions.push(item.amount)
      }
    });
    return this._sum(transactions);
  },

  _sum: function(arr){
    var sum = 0;
    arr.forEach(function(amount, indx, arr){
      sum += amount
    });
    return sum;
  },

  _subtract: function(a, b) {
    return a - b;
  }
})

module.exports = Cashflow;
