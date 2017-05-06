Rails.application.routes.draw do
  resources :comments
  resources :ratings
  resources :users
  resources :books
  resources :categories
  root to: 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
