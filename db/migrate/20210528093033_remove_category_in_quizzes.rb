class RemoveCategoryInQuizzes < ActiveRecord::Migration[6.0]
  def change
    remove_column :quizzes, :category_id, :references
  end
end
