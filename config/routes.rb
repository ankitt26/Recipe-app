Rails.application.routes.draw do
  resources :recipes
  resources :inventories, except: :update do
    resources :inventory_foods
  end
 
  devise_for :users
  resources :foods, only: [:index, :create, :new, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "inventories#index"
end
