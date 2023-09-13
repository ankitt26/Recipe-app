Rails.application.routes.draw do
  resources :recipes
  resources :public_recipes, only: [:index]
  resources :inventories, except: :update
  devise_for :users
  resources :foods, only: [:index, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "inventories#index"
end
