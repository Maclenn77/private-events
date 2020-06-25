class UsersController < ApplicationController
  include SessionsHelper

  def index
    @users = User.all
  end

  def show
    if current_user.nil?
      redirect_to login_path
    else
      @user = User.find(current_user.id)
      @events = Event.where(creator_id: @user.id)
      @invited_to = Invitation.where(guests_id: @user.id)
      @future_events = get_future_events(@user.id)
      @past_events = get_past_events(@user.id)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
      redirect_to root_path
    else
      respond_to do |f|
        f.html { render :new }
        f.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  private

  def user_params
    params.require(:user).permit(:name)
  end

  def get_future_events(user)
    future_event = []
    Event.future.each { |event| future_event << event if event.guests.ids.include? user }
    future_event
  end

  def get_past_events(user)
    past_event = []
    Event.previous.each { |event| past_event << event if event.guests.ids.include? user }
    past_event
  end
end
