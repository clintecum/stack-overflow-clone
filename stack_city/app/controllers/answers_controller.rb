class AnswersController < ApplicationController

  def index
      @answers = Answer.find_by(user_id: params[:user_id])
      render 'index'
  end

  def create
   @user = current_user
    @question = Question.find(params[:question_id])
    @answer =  @user.answers.create(content: params[:content], question_id: @question.id)
    if @answer
      redirect_to @question, status: 201
    else
      redirect_to @question, status: 400
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find_by(id: params[:id])
    @answer.update!(answer_params)
    redirect @answer, status: 202
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find_by(id: params[:id])
    if @answer.id == current_user.id 
      @answer.destroy 
      redirect @question, status: 202
    else
      user_not_authorized
    end
  end

 private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
