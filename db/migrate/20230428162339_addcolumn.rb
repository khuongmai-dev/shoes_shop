class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_orders, :order_subtotal, :decimal
  end
end
