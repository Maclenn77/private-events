module TimeHelper
  def if_future_event(future_events, type)
    if future_events.empty?
      flash.now[:danger] = 'There are no future events'
      link_to 'Create event', create_event_path
    else
      render 'events_list', events: future_events, type: type
    end
  end

  def if_past_event(past_events)
    if past_events.empty?
      flash.now[:danger] = 'There are no previous events'
    else
      render 'events_list', events: past_events
    end
  end

  def phrase(type, user, event)
    if type == 'u'
      "#{user.name} is invited to an event in #{event.location } "
    elsif type == 'e'
      loc = "Event in #{event.location }"
      date = "at #{event.date.to_formatted_s(:rfc822)}."
      return [loc, date]
    end
  end
end
