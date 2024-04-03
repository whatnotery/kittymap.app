Rails.application.routes.draw do
  resources :cats do
    resources :comments, except: %i[index show edit update]
    resources :loves, except: %i[index show edit update]
  end

  passwordless_for :users, at: "/", as: :auth
  resources :users, except: :index

  # Defines the root path route ("/")
  root "cats#index"
  get "/sign_up", to: "users#new", constraints: lambda { |req| req.path.exclude? "rails/active_storage" }
end
