Rails.application.routes.draw do
  resources :recipes
  resources :inventories, except: :update do
    resources :inventory_foods
  end

  devise_for :users
  resources :public_recipes, only: [:index]
  resources :foods, only: [:index, :new, :create, :destroy]
  root "inventories#index"
end
