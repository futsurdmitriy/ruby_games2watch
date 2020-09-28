class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @new_game = Game.new
    if session[:new_game]
      @new_game = Game.new(session[:new_game])
    end
    session.delete(:new_game)
    @modes = Mode.all
    @platforms = Platform.all
  end

  def create
    g = Game.new({
         name: params[:game][:name],
         critics_rate: params[:game][:critics_rate],
         genre: params[:game][:genre],
         company: params[:game][:company],
         publisher: params[:game][:publisher],
         published_at: params[:game][:published_at]
     })
    # g.name = params[:game][:name]
    # g.critics_rate = params[:game][:critics_rate]
    # g.genre = params[:game][:genre]
    # g.company = params[:game][:company]
    # g.publisher = params[:game][:publisher]
    # g.published_at = params[:game][:published_at]

    if params[:game][:platforms] && params[:game][:modes]
      g.modes = Mode.find(params[:game][:modes])
      g.platforms = Platform.find(params[:game][:platforms])
    end

    if g.save
      redirect_to "/admin/games"
    else
      flash[:errors] = g.errors.full_messages
      # game[:name] = params[:game][:name]

      # redirect_to "/admin/games/new"
      session[:new_game] = g
      redirect_to controller: 'games', action: 'new'
      # render controller: 'games', action: 'new'
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :genre, :modes, :platforms,
                                 :published_at, :company, :publisher, :critics_rate)
  end

end
