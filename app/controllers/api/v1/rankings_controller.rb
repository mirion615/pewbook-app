class Api::V1::RankingsController < ApplicationController

  def index
    @scores = Ranking.joins(:user).group(:user_id).select("nickname,sum(percentage_correct_answer) as sum_score").order('sum_score DESC').limit(5)
  end
end



# @scores = Ranking.joins(:user).group(:user_id).select("user_id,sum(percentage_correct_answer) as sum_score").order('sum_score DESC').limit(5)