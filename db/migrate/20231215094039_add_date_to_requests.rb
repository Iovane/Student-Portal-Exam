class AddDateToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :scheduled_date, :date
  end
end
