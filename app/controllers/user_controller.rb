class UserController < ApplicationController
  def index
    @user = User.all 
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
  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
