class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user
      session[:user_id] = @user.id
      flash.now[:success] = "Logged in!"
      redirect_to links_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
