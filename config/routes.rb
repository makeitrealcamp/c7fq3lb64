Rails.application.routes.draw do

  root 'expenses#index'

  devise_for :users

  resources :expenses, only: [:index]

end
