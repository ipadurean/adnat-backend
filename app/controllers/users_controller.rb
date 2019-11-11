class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to organisations_path
    else
      flash[:message] = @user.errors.full_messages
      redirect_to root_path
    end
  end
  
  def edit
    find_user
  end

  def update
    find_user
    if @user.update(user_params)
      flash[:message] = "Your account has been successfully updated."
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end
  
  
  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end
end
