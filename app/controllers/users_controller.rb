# frozen_string_literal: true

class UsersController < ApplicationController
  include SessionsHelper

  def index
    @users = User.all
  end

  def show
    redirect_to login_path if current_user.nil?
    @user = User.find(params[:id])
    @events = Event.where(:creator_id => @user.id)
    @attending = Invitation.where(:guests_id => @user.id)
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
