class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :questions_list
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
