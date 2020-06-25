# frozen_string_literal: true

class EventsController < ApplicationController
  include SessionsHelper

  def new
    redirect_to root_path if current_user.nil?
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)
    @event.creator_id = current_user.id
    @event.save
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
    @guests = @event.guests
    @creator = User.find(@event.creator_id)
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :description, :guest_list)
  end

end
