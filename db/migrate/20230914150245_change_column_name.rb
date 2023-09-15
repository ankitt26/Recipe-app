class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :inventory_foods, :inventories_id, :inventory_id
  end
end
