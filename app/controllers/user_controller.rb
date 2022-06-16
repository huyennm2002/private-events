# require 'session_helper'

class UserController < ApplicationController

  before_action :logged_in_user, only: [:index, :destroy]
  def index
    @user = User.all 
    @current_user = current_user
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome"
      redirect_to root_path
    else
      flash[:alert] = "failed to save"
    end
  end

  def show
    @user = User.find(params[@current_user.id])
    # @created_events =  @user.created_events
    # @attended_events  = @user.attended_events
    # @upcoming_created_events = upcoming_created_events @user
    # @past_created_events = past_created_events @user
    # @upcoming_attended_events = upcoming_attended_events @user 
    # @past_attended_events = past_attended_events @user
  end 

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end

  
end
