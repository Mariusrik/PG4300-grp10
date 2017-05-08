Rails.application.routes.draw do

  root 'books#index', as: 'home'
  resources :comments
  resources :ratings
  resources :users
  resources :books
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
