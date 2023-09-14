Rails.application.routes.draw do
  devise_for :users
  
  resources :recipes
  resources :inventories, except: :update do
    resources :inventory_foods
  end

  resources :foods, only: [:index, :create, :new, :show, :destroy]
  resources :public_recipes, only: [:index]

  root "inventories#index"
end
