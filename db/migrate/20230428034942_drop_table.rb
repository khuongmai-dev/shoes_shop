class DropTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :tax_rates, force: :cascade
    drop_table :shipping_methods, force: :cascade


    add_column :shop_orders, :tax_rate, :decimal, precision: 5, scale: 2

    remove_column :shop_orders, :shipping_method_id
    remove_column :shop_orders, :tax_rate_id
  end
end
