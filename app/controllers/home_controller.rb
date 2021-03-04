class HomeController < ApplicationController
  def index
    @activities = Activity.all
    @masteries = Hash[ActiveRecord::Base.connection.select_rows(Activity.where(user_id: current_user.id).select("start_time as x", "mastery as y"))]
    @pleasures = Hash[ActiveRecord::Base.connection.select_rows(Activity.where(user_id: current_user.id).select("start_time as x", "pleasure as y"))]
    @emotion_scales = Hash[ActiveRecord::Base.connection.select_rows(Emotion.where(user_id: current_user.id).select("created_at as x", "scale*2 as y"))]
    @emotions = Emotion.where("created_at >= ?", Date.today)
  end

  def about
  end
  
end
