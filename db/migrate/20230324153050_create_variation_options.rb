class CreateVariationOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :variation_options do |t|
      t.references :variation, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
