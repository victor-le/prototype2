class AppSchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app_schedule, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:active_sessions]

  # GET /app_schedules
  # GET /app_schedules.json
  def index
    if current_user.admin?
    @app_schedules = AppSchedule.all
    else
      @app_schedules = current_user.app_schedules.where(user_id: current_user)
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
        format.html { redirect_to @app_schedule, notice: 'Appointment was successfully scheduled.' }
        format.json { render :show, status: :created, location: @app_schedule }
        @app_schedule.app_time.update_attribute(:booked, true)
        #method from AppointmentMailer that is supposed to prepare mail to be sent
        #AppointmentMailer.with(app_schedule: @app_schedule, user: current_user).appointment_scheduled.deliver_later
       

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
        format.html { redirect_to @app_schedule, notice: 'Appointment schedule was successfully updated.' }
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
      format.html { redirect_to app_schedules_url, notice: 'Appointment schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def active_sessions
    @active_sessions = AppSchedule.where("appDate < ?", Time.now)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_schedule
      @app_schedule = AppSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_schedule_params
      params.require(:app_schedule).permit(:homeAddress, :homeType, :suiteNumber, :city, :state, :zipcode, :appDate, :user_id, :service_id, :appduration_id, :specialrequirement_id, :app_time_id)
    end

  def must_be_admin
    unless current_user.admin?
      redirect_to app_schedules_path, alert: "You don't have access to this page"
    end
  end

  #def book
    #@invoice = Invoice.update(params[id], payment_total: "20", due_amount: "10", data: clonedata.to_json)
    #@app_time = AppTime.update(params[id], booked: "true")
   # app_time = AppTime.find(params[:app_time_id])
    #app_time.update_attribute(:booked, 'true')
#end
end
