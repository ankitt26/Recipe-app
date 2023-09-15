class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy

  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
end
