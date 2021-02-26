class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.integer :start_time
      t.integer :end_time
      t.date :day
      t.timestamps
    end
  end
end
