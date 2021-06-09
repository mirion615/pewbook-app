class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.integer :percentage_correct_answer
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
