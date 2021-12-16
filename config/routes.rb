Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'contacts#index'
  resources :contacts
  root 'users#index'
  resources :users
end
