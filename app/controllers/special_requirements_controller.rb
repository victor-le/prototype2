class SpecialRequirementsController < ApplicationController
  before_action :set_special_requirement, only: [:show, :edit, :update, :destroy]

  # GET /special_requirements
  # GET /special_requirements.json
  def index
    @special_requirements = SpecialRequirement.all
  end

  # GET /special_requirements/1
  # GET /special_requirements/1.json
  def show
  end

  # GET /special_requirements/new
  def new
    @special_requirement = SpecialRequirement.new
  end

  # GET /special_requirements/1/edit
  def edit
  end

  # POST /special_requirements
  # POST /special_requirements.json
  def create
    @special_requirement = SpecialRequirement.new(special_requirement_params)

    respond_to do |format|
      if @special_requirement.save
        format.html { redirect_to @special_requirement, notice: 'Special requirement was successfully created.' }
        format.json { render :show, status: :created, location: @special_requirement }
      else
        format.html { render :new }
        format.json { render json: @special_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_requirements/1
  # PATCH/PUT /special_requirements/1.json
  def update
    respond_to do |format|
      if @special_requirement.update(special_requirement_params)
        format.html { redirect_to @special_requirement, notice: 'Special requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_requirement }
      else
        format.html { render :edit }
        format.json { render json: @special_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_requirements/1
  # DELETE /special_requirements/1.json
  def destroy
    @special_requirement.destroy
    respond_to do |format|
      format.html { redirect_to special_requirements_url, notice: 'Special requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_requirement
      @special_requirement = SpecialRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_requirement_params
      params.require(:special_requirement).permit(:requirementDesc, :requirementValue)
    end
end
