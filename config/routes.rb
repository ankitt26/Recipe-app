Rails.application.routes.draw do
  resources :inventories, except: :update
  devise_for :users
  resources :foods, only: [:index, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "inventories#index"
end
