Rails.application.routes.draw do
  get 'checkout/new'
  get 'checkout/create'
  devise_for :users, controllers: { confirmations: 'users/confirmations' , passwords: 'users/passwords'}
  root 'welcome#index'

  resources :institution
  # resources :customusers
  resources :checkin, only: [:new, :create,:show]
  resources :checkout, only: [:new, :create]
  resources :user
  resources :custom_user

  
end
