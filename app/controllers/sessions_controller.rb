class SessionsController < ApplicationController
  skip_before_action :login_required, only: %i[new create], raise: false

  def new
    redirect_to root_path unless current_user.nil?
  end

  def create
    user = User.find_it_by_name(params[:session][:name])
    if user.nil?
      # flash[:danger] = []
      # flash.now[:danger] << 'Invalid name' unless params[:session][:name].split
      # flash.now[:danger] << 'Name cannot be blank' if params[:session][:name].split.empty?
      redirect_to login_path, danger: 'Invalid name' unless params[:session][:name].split.empty?
      redirect_to login_path, danger: 'Name cannot be blank' if params[:session][:name].split.empty?
    else
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
