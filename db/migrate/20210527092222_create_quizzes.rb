class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :question,           null: false
      t.string :correct,            null: false
      t.string :incorrect1,         null: false
      t.string :incorrect2,         null: false
      t.string :answer_description, null: false
      t.integer :category_id,       null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
