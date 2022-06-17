# require 'session_helper'

class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:index, :destroy]
  # before_filter :authenticate_user!
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
    @user = User.find(params[:id])
    @created_events =  @user.events
    @attended_events  = @user.attended_events
    # @upcoming_created_events = upcoming_created_events @user
    # @past_created_events = past_created_events @user
    # @upcoming_attended_events = upcoming_attended_events @user 
    # @past_attended_events = past_attended_events @user
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end 

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end

  
end
