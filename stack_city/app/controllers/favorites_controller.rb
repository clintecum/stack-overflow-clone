class FavoritesController < ApplicationController

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
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
end
