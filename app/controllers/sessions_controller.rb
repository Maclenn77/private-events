class SessionsController < ApplicationController
  skip_before_action :login_required, only: %i[new create], raise: false
  include SessionsHelper

  def new
    redirect_to users_show_path unless current_user.nil?
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user.nil?
      flash[:danger] = []
      flash.now[:danger] << 'Invalid name' unless params[:session][:name].split
      flash.now[:danger] << 'Name cannot be blank' if params[:session][:name].split.empty?
      render 'new'
    end
    log_in user
    remember user
    redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end