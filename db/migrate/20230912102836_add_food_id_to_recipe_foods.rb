class AddFoodIdToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_foods, :food_id, :bigint
    change_column_null :recipe_foods, :food_id, false
  end
end
