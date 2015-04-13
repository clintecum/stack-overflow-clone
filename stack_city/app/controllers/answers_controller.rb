class AnswersController < ApplicationController

  def index
      @answers = Answer.where(user_id: params[:user_id])
      render 'index'
  end

  def create
   @user = current_user
   puts params
    @question = Question.find(params[:question_id])
    @answer =  @question.answers.create(content: params[:answer])
    if @answer.save
      redirect_to @question
    else
      redirect_to @question
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
