module EventsHelper
  def creator(event)
    User.find(event.creator_id)
  end
end
