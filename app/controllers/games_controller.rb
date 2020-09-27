class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  def new
    @newGame = Game.new
    @modes = Mode.all
    @platforms = Platform.all
  end
  def create
    g = Game.new
    g.name = params[:game][:name]
    g.critics_rate = params[:game][:critics_rate]
    g.genre = params[:game][:genre]
    g.company = params[:game][:company]
    g.publisher = params[:game][:publisher]
    g.published_at = params[:game][:published_at]

    if params[:game][:platforms] && params[:game][:modes]
      g.modes = Mode.find(params[:game][:modes])
      g.platforms = Platform.find(params[:game][:platforms])
    end

    if g.save
      redirect_to "/admin/games"
    else
      flash[:errors] = g.errors.full_messages
      params[:game] = g
      redirect_to "/admin/games/new"
      # render controller: 'games', action: 'new'
    end
  end
end
