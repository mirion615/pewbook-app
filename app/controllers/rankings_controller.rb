class RankingsController < ApplicationController

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