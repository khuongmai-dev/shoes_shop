class Changes < ActiveRecord::Migration[7.0]
  def change
    remove_column :shop_users, :remember_created_at
    remove_column :shop_users, :email_address
    remove_column :shop_users, :encrypted_password
    remove_column :shop_users, :reset_password_token
    remove_column :shop_users, :reset_password_sent_at
    # add_column :addresses, :country, :string
    # drop_table :provinces
    # drop_table :countries
  end
end
