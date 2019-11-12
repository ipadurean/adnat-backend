class ShiftsController < ApplicationController

  def index
    @user = current_user
    @shifts = Shift.all
  end

end
