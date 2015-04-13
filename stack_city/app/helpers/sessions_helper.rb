module SessionsHelper
  #this is a method that takes a user as an argument and sets a session with keyword "user_id" to have the value of the id of the user
  def log_in(user)
    session[:user_id] = user.id
  end

  #does one of two things.
  #if a current user instance variable already exists it will return the value of it OR it will set @current_user to the result of calling the find_by method onto class User
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authorize
    redirect_to '/login' unless current_user
  end
end