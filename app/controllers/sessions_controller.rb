class SessionsController < ApplicationController
  # skip_before_action :login_required, only: %i[new create]

  def new
    @user = User.new
  end

  def create
     @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to root_path, notice: "Welcome, #{@current_user.username}"}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username)
  end

  def login(user)
    session[:user_id] = nil
  end
end
