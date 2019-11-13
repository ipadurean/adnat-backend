class PasswordResetsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_path, :notice => "Email sent with password reset instructions"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:password, :password_confirmation))
    redirect_to root_path, :notice => "Password has been reset!"
  end

end
