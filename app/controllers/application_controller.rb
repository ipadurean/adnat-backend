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

      def validate_time(time)
          arr = time.split(/\D/)
          arr[0]&&a = arr[0].to_i
          arr[1]&&b = arr[1].to_i
          c = time[-2..-1].downcase
           if (a<13 && b<60 && c == "am" || c == "pm") == false
            flash[:message] = "Time should have format HH:MM AM(or PM)"
            return false
           else
            return true
           end
      end

   

    def validate_date(date)
      arr = date.split(/\D/)
      arr[0]&&a = arr[0].to_i
      arr[1]&&b = arr[1].to_i
      arr[2]&&c = arr[2].to_i
          if (a<13 && b<=Time.days_in_month(a, c)) == false
            flash[:message] = "Date should have format MM/DD/YYYY"
            return false
          elsif (c == Time.zone.now.year) == false
            flash[:message] = "You can only add shifts for current year"
            return false
          else
            return true
          end   
    end

end
