class SessionsController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
  def new
  end

  def create
<<<<<<< HEAD
    user = User.find_by(email: params[:session][:email].downcase)
=======
    user = User.find_by(email: params[:session][:email])
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
<<<<<<< HEAD
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
=======
      render "new"
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
<<<<<<< HEAD

end
=======
end
>>>>>>> 9b00096a14afbec0c1622e9ddc72ac58ebc7d9b9
