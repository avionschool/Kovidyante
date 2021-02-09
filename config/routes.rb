Rails.application.routes.draw do
  resources :homeworks do
    resources :answers
  end
  # devise_for :installs

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
  get   '/qrcodes/qrpage' => 'qrcodes#qrpage', as: 'qr_page'
  resources :teachers, :students, :tasks, :users, :subjects, :attendances
end
