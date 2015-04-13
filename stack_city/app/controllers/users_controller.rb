class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
        if @user.save
          log_in @user
          redirect_to @user
        else
          render :new
        end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(params[:user])
    if @user.update_attributes(user_params)
        redirect_to @user
    else
        render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :location, :first_name, :last_name, :avatar)
  end

end
