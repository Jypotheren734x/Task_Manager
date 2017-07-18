Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      confirmation: 'users/confirmations',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }, path: 'users', path_names: {
      confirmation: 'verification',
      registration: 'register',
      sign_up: 'sign_up'
  }
  resources :users, only: [:index, :show]
  resources :tasks
  resources :projects
  resources :groups
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
