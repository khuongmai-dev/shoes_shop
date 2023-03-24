class CreateUserReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reviews do |t|
      t.references :shop_user, null: false, foreign_key: true
      t.references :order_line, null: false, foreign_key: true
      t.integer :rating_value
      t.text :comment

      t.timestamps
    end
  end
end
