class OrganisationsController < ApplicationController

  def index
    @organisations = Organisation.all
    @user = current_user
    @organisation = Organisation.new
  end

  def show 
    @organisation = Organisation.find(params[:id])
  end

  #create new organisation and automatically add current user to it
  def create
    @user = current_user
    @organisation = Organisation.new(organisation_params)
    @organisation.save
    @user.update(organisation_id: @organisation.id)
    redirect_to organisations_path
  end

  def edit
    @organisation = Organisation.find(params[:id])
    @user = current_user
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    redirect_to organisations_path
  end

  # delete organisation and reset users to default state, not belonging to any organisation
  def destroy
    @user = current_user
    @organisation = Organisation.find(params[:id])
      @organisation.destroy
      users = User.all.select{|user| user.organisation_id == params[:id].to_i}
      users.each do |user|
          user.update(organisation_id: nil)  
      end
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  
end
