class RemoveUserIdFromInstitution < ActiveRecord::Migration[6.0]
  def change
    remove_column :institutions, :user_id, :integer
  end
end
