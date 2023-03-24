class CreateShopUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_users do |t|
      t.string :email_address
      t.integer :phone_number
      t.string :password

      t.timestamps
    end
  end
end
