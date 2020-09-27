class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  def new
    @modes = Mode.all
    @platforms = Platform.all
  end
end
