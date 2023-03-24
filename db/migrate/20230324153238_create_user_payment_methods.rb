class CreateUserPaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payment_methods do |t|
      t.references :shop_user, null: false, foreign_key: true
      t.references :payment_type, null: false, foreign_key: true
      t.string :provider
      t.integer :account_number
      t.date :expriry_date
      t.boolean :is_default

      t.timestamps
    end
  end
end
