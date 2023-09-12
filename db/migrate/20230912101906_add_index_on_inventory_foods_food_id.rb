class AddIndexOnInventoryFoodsFoodId < ActiveRecord::Migration[7.0]
  def change
    add_index :inventory_foods, :food_id, name: "index_inventory_foods_on_food_id"
  end
end
