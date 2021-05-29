class QuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @quizzes = Quiz.all
  end


  private
  def quiz_params
    params.require(:quiz).permit(:question, :correct, :incorrect1, :incorrect2, :answer_description, :category_id).merge(user_id: current_user.id)
  end

end
