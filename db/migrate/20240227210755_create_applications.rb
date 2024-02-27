class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.integer :count
      t.integer :year

      t.timestamps
    end
  end
end
