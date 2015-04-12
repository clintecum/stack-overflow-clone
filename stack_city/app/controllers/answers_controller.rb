class AnswersController < ApplicationController

  def index
    case params
    when params[:id]#viewing question answers
      @answers = Answer.find_by(question: params[:id])
    when params[:user_id] #viewing user answers
      @answers = Answer.find_by(user: params[:user_id])
    end
  end

  def create
    @answer = Answer.new(question: params[:id], user: current_user, content: params[:content])
    if @answer.save

    else

    end
  end

  def update
    answer = Answer.find_by(id: params[:answer_id])
    answer.update!(answer_params)
  end

  def destroy
    @answer = Answer.find_by(id: params[:answer_id])
    if @answer.id == current_user.id 
      @answer.destroy 
    else
      user_not_authorized
    end
  end

 private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
