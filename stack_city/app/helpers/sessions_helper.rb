module SessionsHelper
<<<<<<< HEAD

=======
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

<<<<<<< HEAD
  def logged_in?
    !current_user.nil?
  end

=======
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
<<<<<<< HEAD

  def authorize
    redirect_to '/login' unless current_user
  end

end
=======
end
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
