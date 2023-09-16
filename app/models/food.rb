class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  has_many :inventories, through: :inventory_foods

  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, :measurement_unit, :price, presence: true
end
