Rails.application.routes.draw do
  resources :recipes
  resources :inventories, except: :update do
    resources :inventory_foods
  end
 
  devise_for :users
  resources :foods, only: [:index, :create, :new, :show]
  resources :public_recipes, only: [:index]
  devise_for :users
  resources :foods, only: [:index, :new, :create, :destroy]
  root "inventories#index"
end
