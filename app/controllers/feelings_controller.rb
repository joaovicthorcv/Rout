class FeelingsController < ApplicationController
  before_action :set_feeling, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:index]
  #before_action :correct_user, only: [:show, :edit, :update, :destroy, :extend]

  # GET /emotions
  # GET /emotions.json
  def index
    @feelings = Feeling.all
  end

  # GET /emotions/1
  # GET /emotions/1.json
  def show
  end

  # GET /emotions/new
  def new
    #@emotion = Emotion.new
    @feeling = current_user.feelings.build
    
  end

  # GET /emotions/1/edit
  def edit
  end

  # POST /emotions
  # POST /emotions.json
  def create
    #@emotion = Emotion.new(emotion_params)
    @feeling = current_user.feelings.build(feeling_params)

    respond_to do |format|
      if @feeling.save
        format.html { redirect_to @feeling, notice: 'Feeling was successfully created.' }
        format.json { render :show, status: :created, location: @feeling }
      else
        format.html { render :new }
        format.json { render json: @feeling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emotions/1
  # PATCH/PUT /emotions/1.json
  def update
    respond_to do |format|
      if @feeling.update(feeling_params)
        format.html { redirect_to @feeling, notice: 'Feeling was successfully updated.' }
        format.json { render :show, status: :ok, location: @feeling }
      else
        format.html { render :edit }
        format.json { render json: @feeling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emotions/1
  # DELETE /emotions/1.json
  def destroy
    @feeling.destroy
    respond_to do |format|
      format.html { redirect_to feelings_url, notice: 'Feeling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @feeling = current_user.feelings.find_by(id: params[:id])
    redirect_to feelings_path, notice: (I18n.t 'activerecord.feeling.auth') if @feeling.nil? 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeling
      @feeling = Feeling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feeling_params
      params.require(:feeling).permit(:name)
    end
    
end
