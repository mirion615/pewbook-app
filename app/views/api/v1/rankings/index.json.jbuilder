json.array! @scores do |score|
  json.user_id score.user_id
  # json.nickname score.nickname
  json.sum_score score.sum_score
end