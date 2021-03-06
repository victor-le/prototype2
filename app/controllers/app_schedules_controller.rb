class AppSchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app_schedule, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:active_sessions]


  # GET /app_schedules
  # GET /app_schedules.json
  #def import     @software = Software.find(params[:software_id])     Code.import(@software, params[:file])     redirect_to codes_path, notice: 'Codes were successfully uploaded!'   end

  def index
    if current_user.admin?
    @app_schedules = AppSchedule.all

    respond_to do |format|
      format.html
      format.csv { send_data @app_schedules.to_csv, filename: "appsched-#{Date.today}.csv"}
    end
    else
      @app_schedules = current_user.app_schedules.where(user_id: current_user)
      respond_to do |format|
        format.html
        format.csv { send_data @app_schedules.to_csv, filename: "appsched-#{Date.today}.csv"}
      end
    end
  end

  # GET /app_schedules/1
  # GET /app_schedules/1.json
  def show
  end

  # GET /app_schedules/new
  def new
    @app_schedule = AppSchedule.new
  end

  # GET /app_schedules/1/edit
  def edit
  end

  # POST /app_schedules
  # POST /app_schedules.json
  def create
    @app_schedule = AppSchedule.new(app_schedule_params)
    @app_schedule.user_id = current_user.id
#   


    respond_to do |format|
      if @app_schedule.save
        format.html { redirect_to @app_schedule, notice: 'Appointment was successfully scheduled. Please check your email for confirmation and further details!' }
        format.json { render :show, status: :created, location: @app_schedule }
        @app_schedule.app_time.update_attribute(:booked, true)
        #method from AppointmentMailer that is supposed to prepare mail to be sent
        AppointmentMailer.with(app_schedule: @app_schedule).notify_appointment.deliver!
        AppointmentMailer.with(app_schedule: @app_schedule, user: current_user).appointment_scheduled.deliver!
        #AppointmentMailer.with(app_schedule: @app_schedule, user: current_user).appointment_scheduled.deliver!
       

      else
        format.html { render :new }
        format.json { render json: @app_schedule.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /app_schedules/1
  # PATCH/PUT /app_schedules/1.json
  def update
    respond_to do |format|
      if @app_schedule.update(app_schedule_params)
        AppointmentMailer.with(app_schedule: @app_schedule).update_appointment.deliver!
        AppointmentMailer.with(app_schedule: @app_schedule).notify_appointment_update.deliver!
        format.html { redirect_to @app_schedule, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_schedule }
      else
        format.html { render :edit }
        format.json { render json: @app_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_schedules/1
  # DELETE /app_schedules/1.json
  def destroy
    @app_schedule.destroy
    respond_to do |format|
      @app_schedule.app_time.update_attribute(:booked, false)
      AppointmentMailer.with(app_schedule: @app_schedule).cancel_appointment.deliver!
      AppointmentMailer.with(app_schedule: @app_schedule).notify_appointment_cancel.deliver!
      format.html { redirect_to app_schedules_url, notice: 'Appointment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def active_sessions
    @active_sessions = AppSchedule.where("appDate > ?", Time.now)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_schedule
      @app_schedule = AppSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_schedule_params
      params.require(:app_schedule).permit(:homeAddress, :homeType, :suiteNumber, :city, :state, :zipcode, :comment, :appDate, :user_id, :service_id, :appduration_id, :specialrequirement_id, :app_time_id)
    end

  def must_be_admin
    unless current_user.admin?
      redirect_to app_schedules_path, alert: "You don't have access to this page."
    end
  end



end
