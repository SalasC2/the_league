class UsersController < ApplicationController
  def profile
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to "/users/#{@user.id}/profile"
    else
      flash[:danger] = "Error creating a new instance of yourself!"
      render 'new'
    end
  end

  private

  def user_params
     params.require(:user).permit(:username, :email, :password)
  end

end