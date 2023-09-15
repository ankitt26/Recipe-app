class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def value
    return 'no food error' unless food

    food.price * quantity
  end

  def self.total_price(recipe_foods)
    recipe_foods.reduce(0) { |sum, recipe_food| sum + recipe_food.value }
  end
end
