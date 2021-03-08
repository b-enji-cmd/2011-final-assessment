class ChangeDoctorsIdToDoctorId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :surgeries, :doctors_id, :doctor_id
  end
end
