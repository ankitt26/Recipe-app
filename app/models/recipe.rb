class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def get_foods
    self.foods
  end
end
