class UpdateInstitutionTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :institutions, :users_id
  end
end
