class UpdateUserTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roles, :integer, default: 0
    remove_column :users, :user_role, :string
  end
end
