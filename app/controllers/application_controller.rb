class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :login_required

  # This method checks if we have a user signed in
  def login_required
    redirect_to login_path, notice: 'Log in to edit or delete you post' unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?

  private
  # This method gives us details about our user
  def current_user
    @_current_user ||= session[:current_user_id] &&
     User.find_by(id: session[:current_user_id])
  end

  helper_method :current_user
end
