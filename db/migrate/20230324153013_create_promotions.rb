class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.text :description
      t.float :discount_rate
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
