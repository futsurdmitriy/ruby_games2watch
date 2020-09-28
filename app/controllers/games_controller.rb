class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @new_game = Game.new
    @modes = Mode.all
    @platforms = Platform.all
  end

  def create
    @new_game = Game.new(game_params)

    if params[:game][:platforms] && params[:game][:modes]
      @new_game.modes = Mode.find(params[:game][:modes])
      @new_game.platforms = Platform.find(params[:game][:platforms])
    end

    if @new_game.save
      redirect_to "/admin/games"
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :genre,
                                 :published_at, :company, :publisher, :critics_rate)
  end

end
