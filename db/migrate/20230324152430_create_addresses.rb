class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :unit_number
      t.string :street
      t.string :postal_code
      t.string :city
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
