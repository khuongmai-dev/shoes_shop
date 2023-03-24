class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.integer :parent_id
      t.string :name
      t.string :brand_image

      t.timestamps
    end
  end
end
