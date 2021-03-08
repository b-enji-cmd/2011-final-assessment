class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day
      t.integer :room
      t.references :doctors, foreign_key: true

      t.timestamps
    end
  end
end
