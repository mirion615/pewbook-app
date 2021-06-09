json.array! @scores do |score|
  json.nickname score.nickname
  json.sum_score score.sum_score
end