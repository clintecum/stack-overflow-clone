class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD

  private
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
  
  def user_not_authorized
    flash[:error] = "You don't have access to this section."
    redirect_to :back
  end
=======
  include SessionsHelper
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
end
