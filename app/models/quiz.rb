class Quiz < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user, optional: true

  with_options presence: true do
    validates :question
    validates :correct
    validates :incorrect1
    validates :incorrect2
    validates :answer_description, length: { maximum: 1_000 }
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
    end
  end
end
