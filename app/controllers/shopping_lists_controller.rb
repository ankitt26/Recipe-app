class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def shopping_list
    inventory_id = params[:selected_inventory]
    recipe_id_param = params[:recipe_id_param]
    flash[:alert] = "Recipe ID: #{recipe_id_param}, Inventory ID: #{inventory_id}"
  end
end
