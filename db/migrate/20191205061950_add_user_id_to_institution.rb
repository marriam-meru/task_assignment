class AddUserIdToInstitution < ActiveRecord::Migration[6.0]
  def change
    add_column :institutions, :user_id, :integer
  end
end
