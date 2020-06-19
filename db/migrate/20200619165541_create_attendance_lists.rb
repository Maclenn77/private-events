class CreateAttendanceLists < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_lists do |t|
      t.references :event
      t.boolean :attendance
      t.integer :guest

      t.timestamps
    end
  end
end
