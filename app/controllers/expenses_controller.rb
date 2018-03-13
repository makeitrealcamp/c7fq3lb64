class ExpensesController < ApplicationController
  before_action :require_login
  
  def index
     @expenses = Expense.order("date DESC")

     if params[:concept].present?
       @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
     end

     if params[:category_id].present?
       @expenses = @expenses.where("category_id = ?", params[:category_id])
     end
  end

  private
    def require_login
      unless user_signed_in?
        flash[:error] = "debes iniciar sección"
        redirect_to new_user_session_path
      end
    end
end
