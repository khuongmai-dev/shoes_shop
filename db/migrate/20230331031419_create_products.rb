class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.references :brand, null: false, foreign_key: true
      t.decimal :price
      t.integer :stock_quantity
      t.string :product_image

      t.timestamps
    end
  end
end
