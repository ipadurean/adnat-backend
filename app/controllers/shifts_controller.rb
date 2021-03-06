require 'pry'
require 'date'

class ShiftsController < ApplicationController
  
  def index
    @shift = Shift.new
    @user = current_user
    @users = User.all
    @shifts = Shift.all
  end

  def create
  
    # first validate user input 
    if validate_date(params[:date]) && validate_time(params[:start_time]) && validate_time(params[:finish_time])
  
    # second format params to match database
      @shift = Shift.new
      @shift[:user_id] = params[:user_id]
      arr = params[:date].split(/\D/)
      date_str = [arr[1], arr[0], arr[2]].join("-")
      start_str = params[:start_time]
      finish_str = params[:finish_time]
      @shift[:start] = DateTime.strptime(date_str + " " + start_str, '%d-%m-%Y %I:%M %p')
      @shift[:finish] = DateTime.strptime(date_str + " " + finish_str, '%d-%m-%Y %I:%M %p')
      @shift[:break_length] = params[:break_length]

  # persist data
      @shift.save
    end
    redirect_to shifts_path
  end

  private

  def shift_params
    params.require(:shift).permit(:user_id, :start, :finish, :break_length)
  end

end
