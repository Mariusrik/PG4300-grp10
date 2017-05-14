Rails.application.routes.draw do
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  get 'sessions/new'

  root :to => 'books#index', :as => 'home'
  resources :comments
  resources :ratings
  resources :users
  resources :books do
    resources :comments
  end
  resources :categories
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
