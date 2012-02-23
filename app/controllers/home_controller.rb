class HomeController < ApplicationController
  def index
    @user = User.new unless current_user
  end
end
