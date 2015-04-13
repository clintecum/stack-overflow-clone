class FavoritesController < ApplicationController
  before_filter :find_favorable

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @user = User.find(params[:id])
    @favorite = @user.favorites.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
  end

  def update
    @favorite = Favorite.find(params[:id])
    if @favorite.update(favorite_params)
    else
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to questions_path
  end

  private
    def favorite_params
      params.require(:favorites)
    end

    def find_favorable
      if params[:question_id]
        @favorable = Question.find(params[:question_id])
      elsif params[:answer_id]
        @favorable = Answer.find(params[:answer_id])
      elsif params[:comment_id]
        @favorable = Comment.find(params[:comment_id])
      end
    end
end
