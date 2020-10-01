class NewsController < ApplicationController

  before_action only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    check_user_right([User::ADMIN_ROLE, User::EDITOR_ROLE])
  end

  def index
    @news = News.all
  end

  def new
    @new_news = News.new
  end

  def create
    @new_news = News.new(news_params)
    if params[:news][:game]
      @new_news.game = Game.find(params[:news][:game])
    end
     # Todo: make it via session to assign creator id
    # if session[:user][:id]
    #   @new_news.user = User.find(session[:user][:id])
    # end
    if params[:news][:user]
       @new_news.user = User.find(params[:news][:user])
    end
    if @new_news.save
      redirect_to "/admin/news"
    else
      flash[:errors] = @new_news.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id]
      @news = News.find(params[:id])
    else
      redirect_to "/admin/news"
    end
  end

  def edit
    if params[:id]
      @news_to_edit = News.find(params[:id])
    else
      redirect_to "/admin/news"
    end
  end

  def update
    if params[:id]
      @news_to_edit = News.find(params[:id])
      news_to_edit_game = Integer(params[:news][:game])
      if @news_to_edit.update(news_params) &&
          @news_to_edit.update(game: Game.find(news_to_edit_game))
        redirect_to "/admin/news"
      else
        render :edit
      end
    end
  end

  def destroy
    if params[:id]
      news = News.find(params[:id])
      news.destroy
      redirect_to '/admin/news'
    end
  end

  private

  def news_params
    params.require(:news).permit(:headline, :image, :text)
  end
end
