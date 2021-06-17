class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def show
    @quizzes = Quiz.where(user_id: current_user.id)
  end

  def update
    if user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @user.id
  end
end
