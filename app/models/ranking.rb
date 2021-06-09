class Ranking < ApplicationRecord
  belongs_to :user
  validates :percentage_correct_answer, presence: true


end
