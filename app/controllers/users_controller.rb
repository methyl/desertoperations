class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(params[:user][:username], params[:user][:password])
      redirect_to root_url, :notice => "Signed up! You have been logged in automatically."
    else
      flash.now.alert = "Correct errors in form please!"
      render :new
    end
  end


end
