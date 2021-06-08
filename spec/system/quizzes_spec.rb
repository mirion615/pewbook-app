require 'rails_helper'

RSpec.describe 'クイズ投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @quiz_category_id = 2
    @quiz_question = Faker::Lorem.sentence
    @quiz_correct = Faker::Lorem.sentence
    @quiz_incorrect1 = Faker::Lorem.sentence
    @quiz_incorrect2 = Faker::Lorem.sentence
    @quiz_answer_description = Faker::Lorem.sentence
  end
  context 'クイズを投稿できるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規登録ページへのボタンがあることを確認する
      expect(page).to have_content('クイズ登録')
      # 投稿ページに移動する
      visit new_quiz_path
      # フォームに情報を入力する
      find('.select-box').all('option')[2].select_option
      fill_in 'quiz_question', with: @quiz_question
      fill_in 'quiz_correct', with: @quiz_correct
      fill_in 'quiz_incorrect1', with: @quiz_incorrect1
      fill_in 'quiz_incorrect2', with: @quiz_incorrect2
      fill_in 'quiz_answer_description', with: @quiz_answer_description
      # 送信するとQuizモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Quiz.count }.by(1)
      # ユーザーページに遷移することを確認する
      expect(current_path).to eq(user_path(@user.id))
    end
  end
  context 'クイズが投稿ができないとき'do
    it 'ログインしていないと新規登録ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規登録ページへのボタンがあることを確認する
      expect(page).to have_content('クイズ登録')
      # 登録ページに移動する
      visit new_quiz_path
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end