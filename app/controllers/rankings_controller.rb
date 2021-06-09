class RankingsController < ApplicationController

  def create
    @ranking = Ranking.new(ranking_params)
    @correctRatio = @ranking.percentage_correct_answer
    @userId = @ranking.user_id
    @ranking.save
    redirect_to root_path
  end

  private
  def ranking_params
    params.permit(:percentage_correct_answer).merge(user_id: current_user.id)
  end
end
