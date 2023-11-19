class AddColumnName < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_orders, :payment_status, :string
  end
end
