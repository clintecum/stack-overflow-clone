class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @question = Question.find(params[:id])
    @comment = @question.comments.new
  end

  def create
    @question = Question.find(params[:id])
    @comment = @question.comments.create(comment_params)
    if @comment.save
      redirect_to @comment
    else
      render 'new'
    end
  end

  def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to @comment
      else
        render 'edit'
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to questions_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
