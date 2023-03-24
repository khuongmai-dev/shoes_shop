class CreateShoppingCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_cart_items do |t|
      t.references :product_item, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
