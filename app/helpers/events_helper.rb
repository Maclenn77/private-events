module EventsHelper
  def attending?(event)

  end

  def creator(event)
    creator = User.find(event.creator_id)
  end

end