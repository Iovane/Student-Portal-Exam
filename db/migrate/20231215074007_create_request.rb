class CreateRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :request_code
      t.references :user, foreign_key: true
      t.references :lecturer, foreign_key: true
      t.time :chosen_start
      t.time :chosen_end

      t.timestamps
    end
  end
end
