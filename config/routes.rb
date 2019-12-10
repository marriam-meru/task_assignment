Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations' , passwords: 'users/passwords'}
  root 'custom_user#index'

  resources :institution
  resources :checkin_checkout_history, only: [:new, :create,:show]
  resources :user
  resources :custom_user

  
end
