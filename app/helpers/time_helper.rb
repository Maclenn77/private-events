module TimeHelper
  def if_future_event(future_events, type)
    if future_events.empty?
      flash.now[:danger] = 'There are no future events'
      link_to 'Create event', create_event_path
    else
      render 'events_list', events: future_events, type: type
    end
  end

  def header_btn
    if logged_in?
      render 'logged_in_btn'
    else
      render 'logged_off_btn'
    end
  end

  def if_past_event(past_events, type)
    if past_events.empty?
      flash.now[:danger] = 'There are no previous events'
    else
      render 'events_list', events: past_events, type: type
    end
  end

  def if_created(created_events, type)
    if @created_by_user.empty?
      flash.now[:danger] = "There're no events created by #{@user.name}"
    else

    end
  end

  def phrase(type, user, event)
    if type == 'user created'
      "#{@user.name} created an event in #{event.location} "
    elsif type == 'user attending'
      inv = "#{user.name} is invited to an event in #{event.location } "
      date = "Event date: #{event.date}."
      [inv, date]
    elsif type == 'event'
      loc = "Event in #{event.location }"
      date = "at #{event.date.to_formatted_s(:rfc822)}."
      [loc, date]
    end
  end
end
