class AppAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app_address, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:index, :new, :edit, :show, :destory, :update]

  # GET /app_addresses
  # GET /app_addresses.json
  def index
    @app_addresses = AppAddress.all
  end

  # GET /app_addresses/1
  # GET /app_addresses/1.json
  def show
  end

  # GET /app_addresses/new
  def new
    @app_address = AppAddress.new
  end

  # GET /app_addresses/1/edit
  def edit
  end

  # POST /app_addresses
  # POST /app_addresses.json
  def create
    @app_address = AppAddress.new(app_address_params)

    respond_to do |format|
      if @app_address.save
        format.html { redirect_to @app_address, notice: 'App address was successfully created.' }
        format.json { render :show, status: :created, location: @app_address }
      else
        format.html { render :new }
        format.json { render json: @app_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_addresses/1
  # PATCH/PUT /app_addresses/1.json
  def update
    respond_to do |format|
      if @app_address.update(app_address_params)
        format.html { redirect_to @app_address, notice: 'App address was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_address }
      else
        format.html { render :edit }
        format.json { render json: @app_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_addresses/1
  # DELETE /app_addresses/1.json
  def destroy
    @app_address.destroy
    respond_to do |format|
      format.html { redirect_to app_addresses_url, notice: 'App address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_address
      @app_address = AppAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_address_params
      params.require(:app_address).permit(:homeType, :homeAddress, :suiteNumber, :state, :city, :zipcode)
    end

    def must_be_admin
      unless current_user.admin?
        redirect_to app_schedules_path, alert: "You don't have access to this page"
      end
    end
end
