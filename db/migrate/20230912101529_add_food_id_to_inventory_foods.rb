class AddFoodIdToInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :inventory_foods, :food_id, :bigint
    change_column_null :inventory_foods, :food_id, false
  end
end
