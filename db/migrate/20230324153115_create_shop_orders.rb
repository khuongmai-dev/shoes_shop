class CreateShopOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_orders do |t|
      t.integer :shop_user
      t.datetime :order_date
      t.references :user_payment_method, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :shipping_method, null: false, foreign_key: true
      t.references :tax_rate, null: false, foreign_key: true
      t.decimal :order_total
      t.references :order_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
