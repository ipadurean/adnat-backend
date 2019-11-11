class SessionsController < ApplicationController
 

  def new
    if logged_in?
      redirect_to organisations_path
    end
  end

  def create
    name = params[:name]
    password = params[:password]
    user = User.find_by(name: name)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to organisations_path
    else
      flash[:message]
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:order_id)
    redirect_to root_path
  end
end