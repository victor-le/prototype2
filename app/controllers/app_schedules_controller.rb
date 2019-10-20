class AppSchedulesController < ApplicationController
  before_action :set_app_schedule, only: [:show, :edit, :update, :destroy]
  include ActiveModel::Model

  attr_accessor :homeType, :homeAddress, :suiteNumber, :state, :city, :zipcode, :clientFName, :clientLname,
  :clientEmail, :clientPhone, :addDate

  # GET /app_schedules
  # GET /app_schedules.json
  def index
    @app_schedules = AppSchedule.all
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

    respond_to do |format|
      if @app_schedule.save
        format.html { redirect_to @app_schedule, notice: 'App schedule was successfully created.' }
        format.json { render :show, status: :created, location: @app_schedule }
      else
        format.html { render :new }
        format.json { render json: @app_schedule.errors, status: :unprocessable_entity }
      end
    end
  end


  def save
    return false if invalid?
    ActiveRecord::Base.transaction do
      client = Client.create!(clientFName: clientFName, clientLname: clientLname, clientEmail: clientEmail, clientPhone: clientPhone)
      address = AppAddress.create!(hometype: homeType, homeAddress: homeAddress, suiteNumber: suiteNumber, state: state, city: city, zipcode: zipcode)
      appDate = AppDate.create!(appDate: appDate)
    end
    true
  rescue ActiveRecord::StatementInvalid => e
    # Handle exception that caused the transaction to fail
    # e.message and e.cause.message can be helpful
    errors.add(:base, e.message)
    false
  end
  end




  # PATCH/PUT /app_schedules/1
  # PATCH/PUT /app_schedules/1.json
  def update
    respond_to do |format|
      if @app_schedule.update(app_schedule_params)
        format.html { redirect_to @app_schedule, notice: 'App schedule was successfully updated.' }
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
      format.html { redirect_to app_schedules_url, notice: 'App schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_schedule
      @app_schedule = AppSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_schedule_params
      params.require(:app_schedule).permit(:client_id, :appaddress_id, :apptime_id, :service_id, :appduration_id, :specialrequirement_id)
    end

