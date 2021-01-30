Rails.application.routes.draw do
  devise_for :installs

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   passwords: 'users/passwords',
  #   registrations: 'users/registrations',
  #   :omniauth_callbacks => "users/omniauth_callbacks"
  # }

  devise_for :users, path: "auth", :controllers => {sessions: 'sessions',
     registrations: 'registrations', 
     confirmations: 'confirmations', 
     passwords: 'passwords', 
     omniauth_callbacks: 'users/omniauth_callbacks'}
  # devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"

  resources :teachers, :students, :tasks
end
