class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def new
    puts session[:user_id]
    @question = Question.new
  end

  def create
    @user = current_user
    @question = @user.questions.create(question_params)
    redirect_to @question
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @queston = Question.find_by(params[:question])
    if @question.update_attributes(user_params)
      redirect_to @question
    else
      render "edit"
    end
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user)
  end
end
