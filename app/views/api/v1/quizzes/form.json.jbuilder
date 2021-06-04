json.array! @quizzes do |quiz|
  json.id quiz.id
  json.question quiz.question
  json.correct quiz.correct
  json.incorrect1 quiz.incorrect1
  json.incorrect2 quiz.incorrect2
  json.answer_description quiz.answer_description
  json.category_id quiz.category_id
end