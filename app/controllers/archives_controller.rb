class ArchivesController < ApplicationController
  def index
    @activities = Activity.all.group_by(&:day)
  end
end
