class UsersController < ApplicationController
  include SessionsHelper, UsersHelper

  def index
    @users = User.all
  end

  def show
    if current_user.nil?
      redirect_to login_path
    else
      @user = User.find(params[:id])
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


end
