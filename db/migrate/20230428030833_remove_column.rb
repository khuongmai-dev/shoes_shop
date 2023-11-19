class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :shop_orders, :user_payment_method_id
  end
end
