class CreateProductItemVariationOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_item_variation_options do |t|
      t.references :product_item, null: false, foreign_key: true
      t.references :variation_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
