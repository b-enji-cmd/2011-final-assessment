class RemoveDoctorIdFromSurgery < ActiveRecord::Migration[5.2]
  def change
  	remove_column :doctors, :surgery_id
  end
end
