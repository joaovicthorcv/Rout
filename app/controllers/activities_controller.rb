class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy, :extend]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy, :extend]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.where(user_id: current_user.id)
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    #@activity = Activity.new
    @activity = current_user.activities.build
  end

  def extend
    puts 'test'
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    #@activity = Activity.new(activity_params)
    @activity = current_user.activities.build(activity_params)
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: (I18n.t 'activerecord.activity.created') }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: (I18n.t 'activerecord.activity.updated') }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: (I18n.t 'activerecord.activity.destroyed') }
      format.json { head :no_content }
    end
  end

  def correct_user
    @activity = current_user.activities.find_by(id: params[:id])
    redirect_to activities_path, notice: (I18n.t 'activerecord.activity.auth') if @activity.nil? 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:category_id, :name, :start_time, :end_time, :mastery, :pleasure, :comment, :user_id)
    end
end
