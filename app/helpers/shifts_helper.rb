
module ShiftsHelper

  def shift_date(shift)
    shift.start.strftime("%m/%d/%Y")
  end

  def shift_start(shift)
    shift.start.strftime("%I:%M %p")
  end

  def shift_finish(shift)
    shift.finish.strftime("%I:%M %p")
  end

  

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


end
