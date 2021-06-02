class Api::V1::QuizzesController < ActionController::API
  
  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      render status: :created
    else
      render status: 400, json: {status: 400, message: 'Quizの作成に失敗しました'}
    end
  end
  
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      render status: 200, json: { status:200 }
    end
  end
  
  def destroy
    quiz = Quiz.find(params[:id])
    if quiz.destroy
      render status: 200, json: { status: 200 }
    end
  end
  
  def word
    @quizzes = Quiz.all
  end

  def form
    @quiz = Quiz.find(params[:id])
  end


  
  private
  def quiz_params
    params.require(:quiz).permit(:id, :question, :correct, :incorrect1, :incorrect2, :answer_description, :category_id).merge(user_id: current_user.id)
  end


end
