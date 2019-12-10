class AddUserInCheckinCheckoutHistory < ActiveRecord::Migration[6.0]
  def up
    add_column :checkin_checkout_histories, :user_id, :integer
  end
  
  def down
    remove_column :checkin_checkout_histories, :user_id
  end
end
