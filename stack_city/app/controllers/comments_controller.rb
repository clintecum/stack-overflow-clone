class CommentsController < ApplicationController
  before_filter :find_commentable

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    puts params
    @commentable = find_commentable
    # @comment = @commentable.comments.new
    # @commentable = Question.find(params[:id])
    @comment = @commentable.comments.new
  end

  def create
    puts params
    @commentable = Question.find_by(id: params[:question_id])
    @comment = @commentable.comments.create(comment_params)
    if @comment.save
      redirect_to @commentable
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
      puts params
      @commentable = params[:question_id]
      # @klass = params[:commentable_type].capitalize.constantize
      # @commentable = @klass.find(params[:commentable_id])
    end
end
