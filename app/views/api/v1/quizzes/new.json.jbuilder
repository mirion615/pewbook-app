json.array! @quizzes do |quiz|
  json.id quiz.id
  json.question quiz.question
  json.correct quiz.correct
end