class InventoryFood < ApplicationRecord
    belongs_to :inventory, class_name: 'Inventory', foreign_key: 'inventories_id'
    belongs_to :food, class_name: 'Food', foreign_key: 'food_id'

    # validates :quantity, presence: true
end