var React = require('react');

var Expense = React.createClass({
  getInitialState: function() {
    return {
      isEditing: false
    };
  },

  render: function() {
    return this._buildCells();
  },

  _buildCells: function() {
    if (this.state.isEditing) {
      return (
        <tr className="transaction__edit">
          <td>
            <input ref="name" type="text" defaultValue={this.props.data.name} />
          </td>
          <td>
            <input ref="amount" type="text" defaultValue={this.props.data.amount} />
          </td>
          <td>
            <input ref="transaction_date" type="text" placeholder="YYYY-MM-DD" defaultValue={this.props.data.transaction_date} />
          </td>
          <td>
            <button onClick={this._handleSave}>Save</button>
          </td>
        </tr>
      );
    } else {
      return (
        <tr>
          <td>{this.props.data.name}</td>
          <td>{this.props.data.amount}</td>
          <td>{this.props.data.transaction_date}</td>
          <td>
            <button onClick={this._handleEdit}>Edit</button>
            <button onClick={this._handleRemove}>Remove</button>
          </td>
        </tr>
      );
    }
  },

  _handleEdit: function(event) {
    event.preventDefault();
    this.setState({ isEditing: true })
  },

  _handleRemove: function(event) {
    event.preventDefault();
    this.props.removeExpense(this.props.data.id);
  },

  _handleSave: function(event) {
    event.preventDefault();
    var data = {
      id: this.props.data.id,
      name: this.refs.name.getDOMNode().value.trim(),
      amount: this.refs.amount.getDOMNode().value.trim(),
      transaction_date: this.refs.transaction_date.getDOMNode().value.trim()
    };
    this.setState({isEditing: false})
    this.props.updateExpense(data);
  }
});

module.exports = Expense;
