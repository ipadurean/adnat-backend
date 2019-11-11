class SessionsController < ApplicationController
 

  def new
    if logged_in?
      redirect_to organisations_path
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to organisations_path
    else
      flash[:message] = "Incorrect email or password, please try again!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end