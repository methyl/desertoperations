class WorldsController < ApplicationController
  def index
    @languages = Language.includes(:worlds)
  end
end
