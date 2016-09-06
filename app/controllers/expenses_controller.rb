class ExpensesController < ApplicationController
  def index

    unless params[:category_id].nil? && params[:concept].nil?
      if params[:category_id].length == 0 &&  params[:concept].length == 0
    	@expenses = Expense.order("date DESC")
      elsif params[:category_id].length == 0
    	@expenses = Expense.where("concept LIKE :concept", concept: "%#{params[:concept].upcase}%")
      else
    	@expenses = Expense.where("concept LIKE :concept",concept:"%#{params[:concept].upcase}%").
                            where("category_id = :category_id", category_id: params[:category_id])
      end
    else
      @expenses = Expense.order("date DESC")
    end
  end
end