Rails.application.routes.draw do
  resources :puppet_modules
  resources :debuggers
  resources :puppet_versions
  resources :ruby_versions
  devise_for :users
  root to: "dashboard#index"
  resources :profiles

  resources :user_debugger_assignments, only: [:create, :destroy]
end
