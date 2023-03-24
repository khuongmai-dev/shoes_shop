class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.references :shopping_cart_item, null: false, foreign_key: true
      t.references :shop_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
