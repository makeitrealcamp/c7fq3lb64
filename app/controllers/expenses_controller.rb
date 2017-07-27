class ExpensesController < ApplicationController
  def index
    # if params[:concept].present? && params[:category_id].present?
    #   @expenses = Expense.where(["concept like ? AND category_id = ?", "%#{params[:concept]}%", params[:category_id]]).order("date DESC")
    # elsif params[:concept].present?
    #   @expenses = Expense.where(["concept like ?", "%#{params[:concept]}%"]).order("date DESC")
    # elsif params[:category_id].present?
    #   @expenses = Expense.where(["category_id = ?", params[:category_id]]).order("date DESC")
    # else
    #   @expenses = Expense.order("date DESC")
    # end
    @expenses = Expense.order("date DESC")
    if params[:concept].present?
      @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
    end
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end
  end

end
