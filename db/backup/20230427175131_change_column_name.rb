class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :shop_orders, :shop_user, :shop_user_id
  end
end
