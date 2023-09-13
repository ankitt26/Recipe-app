class AddInventoryIdToInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :inventories, null: false, foreign_key: true, index: true, column: :inventory_id
  end
end
