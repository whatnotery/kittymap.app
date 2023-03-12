Rails.application.routes.draw do
  
  resources :cats, param: :alias do
    resources :comments, except: [:index, :show]
  end

  passwordless_for :users, at: '/', as: :auth
  resources :users, except: [:index], param: :username
  # Defines the root path route ("/")
  root "cats#index" 
  get '/sign_up', to: 'users#new' , constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'}
end
