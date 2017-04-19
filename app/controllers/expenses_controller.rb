class ExpensesController < ApplicationController
  def index
    # @expenses = Expense.order("date DESC")
    if params[:concept] != ""
      if params[:category_id] != ""
        @expenses = Expense.where("concept LIKE ? AND category_id = ?", "%#{params[:concept]}%", params[:category_id])
      else
        @expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%")
      end
    elsif params[:category_id] != ""
      @expenses = Expense.where("category_id = ?", params[:category_id])
    else
      @expenses = Expense.all
    end
  end
end
