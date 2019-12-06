class CreateUserCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_checkouts do |t|
      t.integer :user_id
      t.datetime :checkout_time

      t.timestamps
    end
  end
end
