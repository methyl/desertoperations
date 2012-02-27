class WorldsController < ApplicationController
  def index
    @languages = Language.all
  end
end
