class ApplicationController < ActionController::Base
 
   
  def current_user
    if cookies[:user_id]
      @current_user ||= User.find(cookies[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !!current_user
  end  

end
