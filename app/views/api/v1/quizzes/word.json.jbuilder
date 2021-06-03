json.array! @quizzes do |quiz|
  json.id quiz.id
  json.question quiz.question
  json.correct quiz.correct
  json.answer_description quiz.answer_description
end