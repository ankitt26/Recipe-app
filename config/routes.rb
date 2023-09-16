Rails.application.routes.draw do
  devise_for :users
  
  resources :recipes
  resources :inventories, except: :update do
    resources :inventory_foods
  end

  resources :foods, only: [:index, :create, :new, :show, :destroy]
  resources :public_recipes, only: [:index]

 
get 'shopping_list/recipe_id/:recipe_id/inventory_id/:inventory_id', to: 'shopping_lists#shopping_list', as: 'shopping_list'

post '/submit_food', to: 'recipes#submit', as: 'submit_food'
  root "inventories#index"
end
