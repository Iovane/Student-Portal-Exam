class AddDateToLecture < ActiveRecord::Migration[7.0]
  def change
    add_column :lecturers, :scheduled_date, :date
  end
end
