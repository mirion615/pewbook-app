class Api::V1::QuizzesController < ActionController::API
  
  # 投稿したクイズの編集
  def update
    @quiz = Quiz.find_by(id: params[:id])
    if @quiz.update(quiz_params)
      render status: 200, json: { status:200 }
    end
  end
  
  # 投稿したクイズの削除
  def destroy
    quiz = Quiz.find(params[:id])
    if quiz.destroy
      render status: 200, json: { status: 200 }
    end
  end
  
  # クイズ一覧取得
  def word
    @quizzes = Quiz.order('created_at DESC')
  end

  # クイズ出題時は、選ばれたカテゴリーから、ランダムに５つ取得
  def form
    @quizzes = Quiz.where("category_id = ?", params[:category_id]).order("RAND()").limit(5)
  end

  # userページで、userが投稿したクイズを取得
  def user_words
    @quizzes = Quiz.where(user_id: current_user.id).order('created_at DESC')
  end


  
  private
  def quiz_params
    params.require(:quiz).permit(:id, :question, :correct, :incorrect1, :incorrect2, :answer_description, :category_id).merge(user_id: current_user.id)
  end


end
