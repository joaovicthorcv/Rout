class HomeController < ApplicationController
  def index
    @activities = Activity.where("created_at >= ?", Date.today)
    @emotions = Emotion.where("created_at >= ?", Date.today)
  end

  def about
  end
  
end
