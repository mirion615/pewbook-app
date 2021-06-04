class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]
  before_action :move_to_index, only: [:show]

  def show
    @user= User.find_by(id: params[:id])
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @user.id
  end
end
