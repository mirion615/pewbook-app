json.array! @quizzes do |quiz|
  json.id quiz.id
  json.question quiz.question
  json.correct quiz.correct
  json.category_id quiz.category_id
  json.answer_description quiz.answer_description
end