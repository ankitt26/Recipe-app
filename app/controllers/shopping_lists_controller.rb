class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.all
    @inventory = Inventory.all
  end

  def shopping_list
    params[:selected_inventory]
    recipe_id_param = params[:recipe_id_param]

    @recipe_g = Recipe.find(recipe_id_param)
    @inventory_g = Inventory.find(params[:selected_inventory])

    generate_shopping_list(@recipe_g, @inventory_g)
    # flash.now[:success] = "Shopping list created successfully"
  end

  def food_quantity(food)
    recipe_food = recipe_foods.find_by(food_id: food.id)
    recipe_food&.quantity
  end

  private

  def generate_shopping_list(recipe, inventory)
    # Initialize variables to store missing items and total price
    missing_items = []
    total_price = 0

    # Loop through each food item in the recipe
    recipe.foods.each do |food|
      inventory_item = inventory.foods.find_by(id: food.id)

      # Check if the food item is not found in the inventory or if the quantity is insufficient
      if inventory_item.nil?
        missing_items << food
        total_price += food.price
      elsif inventory_item.quantity < 1 # Assuming 1 unit per recipe ingredient
        missing_items << food
        total_price += (1 - inventory_item.quantity) * food.price
      end
    end

    # Render or pass the missing_items and total_price to your view
    # For example:
    @missing_items = missing_items
    @total_price = total_price
  end
end
