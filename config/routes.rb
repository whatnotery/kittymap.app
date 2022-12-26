Rails.application.routes.draw do
  resources :comments
  resources :cats
  passwordless_for :users, at: '/', as: :auth
  resources :users
  # Defines the root path route ("/")
  root "cats#index" 
  get '/sign_up', to: 'users#new' , constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'}
end
