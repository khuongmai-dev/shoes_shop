class Changes < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :country, :string
    drop_table :provinces
    drop_table :countries
  end
end
