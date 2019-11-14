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
      cookies[:user_id] = @user.id
      redirect_to organisations_path
    else
      flash[:message] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
  
  def edit
    find_user
  end

  def update
    find_user
    if @user.update(user_params)
      flash[:message] = "Your account has been successfully updated."
      redirect_to organisations_path
    else
      
      render :edit
    end
  end

  def switch_organisation
    @user = current_user
    @user.shifts.destroy_all
    @user.update(organisation_id: params[:organisation_id])
    redirect_to organisations_path
  end
  
  
  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:organisation_id, :name, :password, :password_confirmation, :email)
  end
end
