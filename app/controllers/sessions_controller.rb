class SessionsController < ApplicationController
 

  def new
    if logged_in?
      redirect_to organisations_path
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:user_id] = user.id  #store user id in cookie permanently if remember me is selected
      else
        cookies[:user_id] = user.id
      end
      redirect_to organisations_path, :notice => 'Logged in'
    else
      flash[:message] = "Incorrect email or password, please try again!"
      redirect_to login_path
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_path, notice: "Logged out!"
  end
end