class PagesController < ApplicationController
  def home
    @latest_news = News.all.order(created_at: :desc).limit(3)
    @latest_games = Game.all.order(published_at: :desc).limit(3)
  end
  def contact_us

  end
  def about_us

  end
end
