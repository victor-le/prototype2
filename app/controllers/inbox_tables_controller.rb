class InboxTablesController < ApplicationController
  before_action :set_inbox_table, only: [:show, :edit, :update, :destroy]

  # GET /inbox_tables
  # GET /inbox_tables.json
  def index
    @inbox_tables = InboxTable.all
  end

  # GET /inbox_tables/1
  # GET /inbox_tables/1.json
  def show
  end

  # GET /inbox_tables/new
  def new
    @inbox_table = InboxTable.new
  end

  # GET /inbox_tables/1/edit
  def edit
  end

  # POST /inbox_tables
  # POST /inbox_tables.json
  def create
    @inbox_table = InboxTable.new(inbox_table_params)

    respond_to do |format|
      if @inbox_table.save
        format.html { redirect_to @inbox_table, notice: 'Inbox table was successfully created.' }
        format.json { render :show, status: :created, location: @inbox_table }
      else
        format.html { render :new }
        format.json { render json: @inbox_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inbox_tables/1
  # PATCH/PUT /inbox_tables/1.json
  def update
    respond_to do |format|
      if @inbox_table.update(inbox_table_params)
        format.html { redirect_to @inbox_table, notice: 'Inbox table was successfully updated.' }
        format.json { render :show, status: :ok, location: @inbox_table }
      else
        format.html { render :edit }
        format.json { render json: @inbox_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inbox_tables/1
  # DELETE /inbox_tables/1.json
  def destroy
    @inbox_table.destroy
    respond_to do |format|
      format.html { redirect_to inbox_tables_url, notice: 'Inbox table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inbox_table
      @inbox_table = InboxTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inbox_table_params
      params.fetch(:inbox_table, {})
    end
end
