class CreateCheckinCheckoutHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :checkin_checkout_histories do |t|
      t.integer :user_checkin_checkout_status, default: 0
      t.timestamps
    end
  end
end
