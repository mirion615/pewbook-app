class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quizzes = Quiz.all
  end
end
