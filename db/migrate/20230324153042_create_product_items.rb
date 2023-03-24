class CreateProductItems < ActiveRecord::Migration[7.0]
  def change
    create_table :product_items do |t|
      t.references :product, null: false, foreign_key: true
      t.string :SKU
      t.integer :stock_quantity
      t.string :product_image
      t.decimal :price

      t.timestamps
    end
  end
end
