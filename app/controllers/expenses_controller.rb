class ExpensesController < ApplicationController
  def index

    @expenses = Expense.order("date DESC")

    if params[:concept].present?
    	@expenses = Expense.where("concept LIKE :concept", {concept:"%#{params[:concept]}%"})	 

	elsif params[:category_id].present?
    	@expenses = Expense.where("category_id = :category_id", {category_id:"#{params[:category_id]}%"})
    else
    	@expenses = Expense.where("concept LIKE :concept AND category_id = :category_id", {concept: "%#{params[:concept]}%",  category_id:"{params[:category_id]}"})	
	
    end 

  end
end

