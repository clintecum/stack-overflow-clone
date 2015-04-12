class CommentsController < ApplicationController
  before_filter :find_commentable

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @commentable = find_commentable
    @comment = @commentable.comments.new
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.create(comment_params)
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

    def find_commentable
      if params[:question_id]
        @commentable = Question.find(params[:question_id])
      elsif params[:answer_id]
        @commentable = Answer.find(params[:answer_id])
      end
    end
end
