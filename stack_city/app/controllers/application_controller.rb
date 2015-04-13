class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def user_not_authorized
    flash[:error] = "You don't have access to this section."
    redirect_to :back
  end
end
