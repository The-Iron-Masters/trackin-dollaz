class ExpensesController < ApplicationController
  def index
    if current_user
      respond_to do |format|
        format.html
        format.json do
          @expenses = current_user.expenses.order(id: :asc).all
        end
      end
    else
      redirect_to '/login'
    end
  end

  def create
    @expense = current_user.expenses.new(expense_params)
    respond_to do |format|
      if @expense.save
        format.json { render json: {}, status: 200}
      else
        format.json { render json: @expense.errors, status: 422 }
      end
    end
  end

  def update
    @expense = get_expense
    respond_to do |format|
      if @expense.update_attributes(expense_params)
        format.json { render json: {}, status: 202 }
      else
        format.json { render json: @expense.errors, status: 422 }
      end
    end
  end

  def destroy
    @expense = get_expense
    @expense.destroy
    respond_to do |format|
      format.json { render json: {}, status: 200 }
    end
  end


  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :transaction_type, :transaction_date)
  end

  def get_expense
    current_user.expenses.find(params[:id])
  end
end
