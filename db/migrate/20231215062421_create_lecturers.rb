class CreateLecturers < ActiveRecord::Migration[7.0]
  def change
    create_table :lecturers do |t|
      t.string :name
      t.references :subject, null: false, foreign_key: true
      t.time :from_time
      t.time :to_time

      t.timestamps
    end
  end
end
