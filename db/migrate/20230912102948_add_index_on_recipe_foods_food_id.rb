class AddIndexOnRecipeFoodsFoodId < ActiveRecord::Migration[7.0]
  def change
    add_index :recipe_foods, :food_id, name: "index_recipe_foods_on_food_id"
  end
end
