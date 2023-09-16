class ShoppingListsController < ApplicationController
    def index
        @recipe = Recipe.all
    end

    def shopping_list 
        recipe_id = params[:recipe_id]
        inventory_id = params[:inventory_id]
      
        flash[:alert] = "Recipe ID: #{recipe_id}, Inventory ID: #{inventory_id}"
      end
      
end
