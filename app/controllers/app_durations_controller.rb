class AppDurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app_duration, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:index, :new, :edit, :show, :destory, :update]

  # GET /app_durations
  # GET /app_durations.json
  def index
    @app_durations = AppDuration.all
  end

  # GET /app_durations/1
  # GET /app_durations/1.json
  def show
  end

  # GET /app_durations/new
  def new
    @app_duration = AppDuration.new
  end

  # GET /app_durations/1/edit
  def edit
  end

  # POST /app_durations
  # POST /app_durations.json
  def create
    @app_duration = AppDuration.new(app_duration_params)

    respond_to do |format|
      if @app_duration.save
        format.html { redirect_to @app_duration, notice: 'App duration was successfully created.' }
        format.json { render :show, status: :created, location: @app_duration }
      else
        format.html { render :new }
        format.json { render json: @app_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_durations/1
  # PATCH/PUT /app_durations/1.json
  def update
    respond_to do |format|
      if @app_duration.update(app_duration_params)
        format.html { redirect_to @app_duration, notice: 'App duration was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_duration }
      else
        format.html { render :edit }
        format.json { render json: @app_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_durations/1
  # DELETE /app_durations/1.json
  def destroy
    @app_duration.destroy
    respond_to do |format|
      format.html { redirect_to app_durations_url, notice: 'App duration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_duration
      @app_duration = AppDuration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_duration_params
      params.require(:app_duration).permit(:duration, :durationPrice)
    end
    def must_be_admin
      unless current_user.admin?
        redirect_to app_schedules_path, alert: "You don't have access to this page"
      end
    end
end
