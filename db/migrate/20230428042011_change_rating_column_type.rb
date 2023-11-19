class ChangeRatingColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :shop_orders, :tax_rate, :float
  end
end
