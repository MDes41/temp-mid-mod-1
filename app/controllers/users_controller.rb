class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to links_path
    else
      render :new
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password_digest, :password_confirmation)
  end
end
