class Inventory < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :inventory_foods, class_name: 'InventoryFood', dependent: :destroy
  has_many :foods, through: :inventory_foods
end
