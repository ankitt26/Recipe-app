class AddColumnToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :user_id, :bigint, null: false
  end
end
