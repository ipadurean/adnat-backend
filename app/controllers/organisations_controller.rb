class OrganisationsController < ApplicationController

  def index
    @organisations = Organisation.all
    @user = current_user
  end

  def show 
    @organisation = Organisation.find(params[:id])
  end
end
