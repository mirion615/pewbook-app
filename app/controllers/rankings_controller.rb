class RankingsController < ApplicationController

  def index
    @ranking_data = Ranking.joins(:user).limit(10).order('sum_percentage_correct_answer DESC').group(:nickname).sum(:percentage_correct_answer)
  end
  def create
    score = Ranking.new(ranking_params)
    score.save
    redirect_to form_quizzes_path
  end

  private
  def ranking_params
    params.permit(:percentage_correct_answer).merge(user_id: current_user.id)
  end

end