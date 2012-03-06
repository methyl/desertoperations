class PlayersController < ApplicationController
  def index
    @players = Player.where(:world_id => params['world_id'] || 1).order('score').page(params['page']).per(50).includes(:scores)
    
  end
end
