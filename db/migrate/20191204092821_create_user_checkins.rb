class CreateUserCheckins < ActiveRecord::Migration[6.0]
  def change
    create_table :user_checkins do |t|
      t.integer :user_id
      t.datetime :checkin_time

      t.timestamps
    end
  end
end
