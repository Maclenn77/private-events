class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    redirect_to root_path if current_user.nil?

    @user = User.find(params[:id])
    @created_by_user = Event.creations(@user)
    @past_events = get_past_events(@user)
    @future_events = get_future_events(@user)
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

  def get_past_events(user)
    past_event = []
    Event.previous.each { |event| past_event << event if event.guests.ids.include? user.id }
    past_event
  end

  def get_future_events(user)
    future_event = []
    Event.future.each { |event| future_event << event if event.guests.ids.include? user.id }
    future_event
  end

  def events_created_by(user)
    Event.creations(user)
  end

  def current_user
    @current_user ||= User.return_current_user(session[:user_id]) if session[:user_id]
  end
end
