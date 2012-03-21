class SpyController < ApplicationController
  before_filter :require_login
  
  def index
  end
  
  def find
    @player = Player.find_by_player_name(params[:player_name])
  end
  
  def check
    @player = Player.find_by_player_name(params[:player_name])
  end
  
  def create
    @player = Player.find_by_player_name(params[:player_name])
    @spy = current_user.spies.create(:player => @player)
  end
  
  def validate
    @spy = Spy.find(params[:id])
    if @spy.ready?
      @spy.update_attributes :bank_level => @spy.player.bank_level, :score => @spy.player.scores.last
    end
  end
  
end
