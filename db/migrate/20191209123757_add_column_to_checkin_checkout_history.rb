class AddColumnToCheckinCheckoutHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :checkin_checkout_histories, :user_time, :datetime
  end
end
