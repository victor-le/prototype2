class AppTimesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app_time, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:index, :new, :edit, :show, :destory, :update]

  # GET /app_times
  # GET /app_times.json
  def index
    if current_user.admin?
    @app_times = AppTime.all
    end
  end

  # GET /app_times/1
  # GET /app_times/1.json
  def show
  end

  # GET /app_times/new
  def new
    @app_time = AppTime.new
  end

  # GET /app_times/1/edit
  def edit
  end

  # POST /app_times
  # POST /app_times.json
  def create
    @app_time = AppTime.new(app_time_params)

    respond_to do |format|
      if @app_time.save
        format.html { redirect_to @app_time, notice: 'Appointment time was successfully created.' }
        format.json { render :show, status: :created, location: @app_time }
      else
        format.html { render :new }
        format.json { render json: @app_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_times/1
  # PATCH/PUT /app_times/1.json
  def update
    respond_to do |format|
      if @app_time.update(app_time_params)
        format.html { redirect_to @app_time, notice: 'Appointment time was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_time }
      else
        format.html { render :edit }
        format.json { render json: @app_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_times/1
  # DELETE /app_times/1.json
  def destroy
    @app_time.destroy
    respond_to do |format|
      format.html { redirect_to app_times_url, notice: 'Appointment time was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_time
      @app_time = AppTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_time_params
      params.require(:app_time).permit(:appDate)
    end

    def must_be_admin
      unless current_user.admin?
        redirect_to app_schedules_path, alert: "You don't have access to this page."
      end
    end
end
