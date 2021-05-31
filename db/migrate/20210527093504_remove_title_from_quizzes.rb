class RemoveTitleFromQuizzes < ActiveRecord::Migration[6.0]
  def change
    remove_column :quizzes, column: :title, type: :string
  end
end
