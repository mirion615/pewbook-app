class Quiz < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :question
    validates :correct
    validates :incorrect1
    validates :incorrect2
    validates :answer_description
    
    # with_options numericality: { other_than: 0 } do
    #   validates :category_id
    # end
  end
end
