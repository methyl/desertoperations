class UsersController < ApplicationController
  before_filter :require_login, :except => [:new, :create]
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
  
  def settings
    
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user]
      redirect_to account_settings_path, :notice => "Account updated successfuly."
    else
      flash.now.alert = "Something went wrong"
      render :settings
    end
  end
end
