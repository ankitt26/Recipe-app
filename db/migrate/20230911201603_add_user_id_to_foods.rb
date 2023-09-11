class AddUserIdToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :user_id, :bigint
    change_column_null :foods, :user_id, false
  end
end
