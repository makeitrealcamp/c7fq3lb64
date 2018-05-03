class ExpensesController < ApplicationController
	before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)

    @expenses = Expense.where(user_id: current_user.id).order("date DESC")
    
    if params[:concept].present? 
      @expenses = user.expenses.where("concept LIKE ?", "%#{params[:concept]}%")
    end
    if params[:category_id].present? 
      @expenses = user.expenses.where("category_id = ?", params[:category_id])
    end
  end
end
