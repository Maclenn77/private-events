module UsersHelper

  def get_past_events(user)
    past_event = []
    Event.previous.each { |event| past_event << event if event.guests.ids.include? user }
    past_event
  end

  def get_future_events(user)
    future_event = []
    Event.future.each { |event| future_event << event if event.guests.ids.include? user }
    future_event
  end

  def events_created_by(user)
    events = Event.where(creator_id: user.id)
  end

end
