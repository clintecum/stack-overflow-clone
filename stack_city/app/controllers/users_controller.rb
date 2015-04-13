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
    render :edit
  end

  def update
    @user = User.find_by(id: params[:id])
    puts @user.username
    puts user_params
    @user.update_attributes(user_params)
    if @user.save!
      puts "SUCCESS"
        redirect_to @user
    else
       puts "FAIL"
        render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :location, :first_name, :last_name, :avatar)
  end

end
