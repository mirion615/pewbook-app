class Api::V1::RankingsController < ApplicationController

  def index
    @scores = Ranking.joins(:user).group(:user_id).select("nickname,sum(percentage_correct_answer) as sum_score").order('sum_score DESC')
    @nickname = User.pluck(:nickname)
    render json: @nickname
  end
end


# def index
#   @scores = Ranking.group(:user_id).select("nickname,sum(percentage_correct_answer) as sum_score").order('sum_score DESC').limit(5).to_a
#   @nickname = User.pluck(:nickname)
# end
# end


# @scores = Ranking.joins(:user).group(:user_id).select("user_id,sum(percentage_correct_answer) as sum_score").order('sum_score DESC').limit(5