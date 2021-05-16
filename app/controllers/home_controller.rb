class HomeController < ApplicationController
  def index
    @activities = Activity.all
    @masteries = Hash[ActiveRecord::Base.connection.select_rows(Activity.where(user_id: current_user.id).select("start_time as x", "mastery as y"))]
    @pleasures = Hash[ActiveRecord::Base.connection.select_rows(Activity.where(user_id: current_user.id).select("start_time as x", "pleasure as y"))]
    @emotion_scales = Hash[ActiveRecord::Base.connection.select_rows(Emotion.where(user_id: current_user.id).select("created_at as x", "scale*2 as y"))]
    @emotions = Emotion.where("created_at >= ?", Date.today)
    @chart_period = 7
  end

  def chart_period
    @chart_period = DateTime.now.days_ago(params[:num_of_days].to_i)
  end

  def chart_seven_days
    @chart_period = 7
  end
  
  def chart_thirty_days
    @chart_period = 30
  end

  def chart_year
    @chart_period = 365
  end
  
end
