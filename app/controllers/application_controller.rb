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
          arr = time.split(/\D/)   #isolate numbers
          arr[0] && a = arr[0].to_i  #convert into integer
          arr[1] && b = arr[1].to_i  
          c = arr[0]+":"+arr[1]+"AM" #create the desired time format
          d = arr[0]+":"+arr[1]+"PM" 
         
           if (a>0 && a<13 && b<60 && time == c || time == d) == false #validate the time format
            flash[:message] = "Time should have format HH:MM AM(or PM)"
            return false
           else
            return true
           end
      end

   

    def validate_date(date)
      arr = date.split(/\D/) #isolate numbers
      arr[0]&&a = arr[0].to_i  #convert into integer
      arr[1]&&b = arr[1].to_i
      arr[2]&&c = arr[2].to_i
      d = arr[0]+"/"+arr[1]+"/"+arr[2] #create the desired date format

          if (a>0 && a<13 && b>0 && b<=Time.days_in_month(a, c) && date == d) == false #validate the date format
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
