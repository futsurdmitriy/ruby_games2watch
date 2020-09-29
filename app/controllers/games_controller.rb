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
    if params[:game][:platforms]
      @new_game.platforms = Platform.find(params[:game][:platforms])
    end
    if params[:game][:modes]
      @new_game.modes = Mode.find(params[:game][:modes])
    end
    if @new_game.save
      redirect_to "/admin/games"
    else
      flash[:errors] = @new_game.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id]
      @game = Game.find(params[:id])
    else
      redirect_to "/admin/games"
    end
  end

  def edit
    if params[:id]
      @game_to_edit = Game.find(params[:id])
    else
      redirect_to "/admin/games"
    end
  end

  def update
    if params[:id]
      @game_to_edit = Game.find(params[:id])
      game_to_edit_platforms = params[:game][:platforms]
      game_to_edit_modes = params[:game][:modes]
      if @game_to_edit.update(game_params) &&
          @game_to_edit.update(platforms: Platform.find(game_to_edit_platforms)) &&
          @game_to_edit.update(modes: Mode.find(game_to_edit_modes))
        redirect_to "/admin/games"
      else
        render :edit
      end
    end
  end

  def destroy
    if params[:id]
      game = Game.find(params[:id])
      game.destroy
      redirect_to '/admin/games'
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :genre,
                                 :published_at, :company, :publisher, :critics_rate)
  end


end
