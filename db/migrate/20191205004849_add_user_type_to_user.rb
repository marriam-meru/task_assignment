class AddUserTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_role, :string , default: "No Role"
  end
end
