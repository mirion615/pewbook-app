class RankingsController < ApplicationController

  def index
    # userモデルとつなげて、合計点数が一番多いuser_idからnicknameを取得する
    @ranking_data = Ranking.joins(:user).limit(10).order('sum_percentage_correct_answer DESC').group(:nickname).sum(:percentage_correct_answer)
  end

  def create
    # 問題1セットを時終わる毎に点数を送信
    score = Ranking.new(ranking_params)
    score.save
    redirect_to form_quizzes_path
  end

  private
  def ranking_params
    params.permit(:percentage_correct_answer).merge(user_id: current_user.id)
  end

end