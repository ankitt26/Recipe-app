class RemoveUserIdFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :user_id
  end
end
