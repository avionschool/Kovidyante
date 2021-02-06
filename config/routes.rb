Rails.application.routes.draw do
  resources :homeworks, only: [:index, :new, :create, :destroy]  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "home#index"

  resources :teachers, :students, :attendances, :subjects
  
end
