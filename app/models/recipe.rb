class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods , dependent: :destroy
  has_many :foods, through: :recipe_foods

  def foods_in_recipe
    foods
  end

  def food_quantity(food)
    recipe_food = recipe_foods.find_by(food_id: food.id)
    recipe_food&.quantity
  end
end
