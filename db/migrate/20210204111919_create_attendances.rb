class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.boolean :status
      t.integer :student_id
      t.string :student_name

      t.timestamps
    end
  end
end
