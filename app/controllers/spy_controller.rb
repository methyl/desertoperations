class SpyController < ApplicationController
  before_filter :require_login
  
  respond_to :html, :json
  
  def index
  end
  
  def find
    @player = Player.select("id, player_name").find_by_player_name(params[:player_name])
    respond_with(@player)
  end
  
  def check
    raise "not available" unless Player.find(params[:player_id]).available?
    @player = Player.select("id, player_name").find(params[:player_id])
    respond_with @player
  end
  
  def create
    @spy = current_user.spies.create(:player => Player.find(params[:player_id]))
    respond_with @spy
  end
  
  def validate
    @spy = Spy.find(params[:spy_id])
    if @spy.ready?
      @spy.update_attributes :bank_level => @spy.player.bank_level, :score => @spy.player.scores.last
    end
    respond_with @spy
  end
  
end
