class QuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:show]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to user_path(current_user.id)
  end


  private
  def quiz_params
    params.require(:quiz).permit(:question, :correct, :incorrect1, :incorrect2, :answer_description, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @user.id
  end

end
