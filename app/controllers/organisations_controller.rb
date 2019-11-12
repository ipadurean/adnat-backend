class OrganisationsController < ApplicationController

  def index
    @organisations = Organisation.all
    @user = current_user
    @organisation = Organisation.new
  end

  def show 
    @organisation = Organisation.find(params[:id])
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.save
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

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  
end
