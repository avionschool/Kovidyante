Rails.application.routes.draw do
<<<<<<< HEAD
  resources :homeworks, only: [:index, :new, :create, :destroy]  
  resources :teachers
  resources :students
=======
  # devise_for :installs

>>>>>>> c5b0e1bc9685e99a480045735cab615a972726ef
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   passwords: 'users/passwords',
  #   registrations: 'users/registrations',
  #   :omniauth_callbacks => "users/omniauth_callbacks"
  # }

  devise_for :users, :controllers => {
     omniauth_callbacks: 'users/omniauth_callbacks'}
  # devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"

  resources :teachers, :students, :tasks, :users, :subjects
end
