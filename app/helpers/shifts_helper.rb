
module ShiftsHelper

#format dates

  def shift_date(shift)
    shift.start.strftime("%m/%d/%Y")
  end

  def shift_start(shift)
    shift.start.strftime("%I:%M %p")
  end

  def shift_finish(shift)
    shift.finish.strftime("%I:%M %p")
  end

  
# determine the shift's total worked hours
  def hours_worked(shift)
    start_time_minutes = shift.start.strftime("%H").to_i * 60 + shift.start.strftime("%M").to_i
    end_time_minutes = shift.finish.strftime("%H").to_i * 60 + shift.finish.strftime("%M").to_i
      if start_time_minutes > end_time_minutes
        total = 1440 - start_time_minutes + end_time_minutes - shift.break_length
      else
        total = end_time_minutes - start_time_minutes - shift.break_length
      end
    return (total/60.to_f).round(2)
  end

  def shift_cost(user, shift)
    Organisation.find_by_id(user.organisation_id).hourly_rate * hours_worked(shift)
  end

#filtering shifts based on current organisation
  def filter_shifts(current_user)
    shifts = []
      users = @users.select{|user| user.organisation_id == current_user.organisation_id}
      @shifts.each do |shift|
              users.each do |user|
                if user.id == shift.user_id
                  shifts.push(shift)
                end
              end
            end
          return shifts.reverse
   end


end
