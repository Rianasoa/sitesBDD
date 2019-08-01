class RemoveColumnFromDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :specialty_id
  end
end
