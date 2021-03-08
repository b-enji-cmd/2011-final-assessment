class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :years_practiced
      t.string :uni
 
      t.timestamps
    end
  end
end
