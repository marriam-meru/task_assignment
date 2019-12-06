class AddIdInUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :institution_id, :integer
  end
end
