class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
