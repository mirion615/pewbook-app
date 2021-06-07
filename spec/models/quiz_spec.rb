require 'rails_helper'
RSpec.describe Quiz, type: :model do
  before do 
    @quiz = FactoryBot.build(:quiz)
  end

  describe 'クイズ投稿機能' do
    context 'クイズが投稿できるとき' do
      it '条件が満たされていれば投稿できる' do
        expect(@quiz).to be_valid
      end
      it 'answer_descriptionが1000文字以内なら投稿できる' do
        @quiz.answer_description = 'aaaaaaaaaaaa'
        expect(@quiz).to be_valid
      end
    end

    context 'クイズが出題できないとき' do
      it 'category_idが空では投稿できない' do
        @quiz.category_id = 1
        @quiz.valid?
        expect(@quiz.errors.full_messages).to include('Category must be other than 1')
      end
      it 'questionが空では投稿できない' do
        @quiz.question = ''
        @quiz.valid?
        expect(@quiz.errors.full_messages).to include("Question can't be blank")
      end
      it 'correctが空では投稿できない' do
        @quiz.correct = ''
        @quiz.valid?
        expect(@quiz.errors.full_messages).to include("Correct can't be blank")
      end
      it 'incorrect1が空では投稿できない' do
        @quiz.incorrect1 = ''
        @quiz.valid?
        expect(@quiz.errors.full_messages).to include("Incorrect1 can't be blank")
      end
      it 'incorrect2が空では投稿できない' do
        @quiz.incorrect2 = ''
        @quiz.valid?
        expect(@quiz.errors.full_messages).to include("Incorrect2 can't be blank")
      end
      it 'answer_descriptionが空では投稿できない' do
        @quiz.answer_description = ''
        @quiz.valid?
        expect(@quiz.errors.full_messages).to include("Answer description can't be blank")
      end
    end
  end
end