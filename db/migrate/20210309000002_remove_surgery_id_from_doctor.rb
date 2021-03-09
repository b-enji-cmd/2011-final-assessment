class RemoveSurgeryIdFromDoctor < ActiveRecord::Migration[5.2]
  def change
  	remove_column :surgeries, :doctor_id
  end
end
