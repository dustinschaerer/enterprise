class DebuggersController < ApplicationController
  before_action :set_debugger, only: [:show, :edit, :update, :destroy]

  # GET /debuggers
  # GET /debuggers.json
  def index
    @debuggers = Debugger.all
  end

  # GET /debuggers/1
  # GET /debuggers/1.json
  def show
  end

  # GET /debuggers/new
  def new
    @debugger = Debugger.new
    # @debugger.user_debugger_assignments.build.build_user
    # @debugger.puppet_module_debugger_assignments.build.build_puppet_module
  end

  # GET /debuggers/1/edit
  def edit
  end

  # POST /debuggers
  # POST /debuggers.json
  def create
    @debugger = Debugger.new(debugger_params)
    @debugger.save
    puppet_module_ids = params[:debugger][:puppet_module_ids]


    params[:debugger][:puppet_module_ids].each do |pm_id|
      @debugger.puppet_modules << PuppetModule.find(pm_id) unless pm_id.blank?
    end


    # raise debugger_params[:puppet_module_ids].inspect


    # raise debugger_params.inspect
    # puppet_module_ids.each do |pm|
    #   @debugger.puppet_modules << PuppetModule.find(pm) unless pm.blank?
    # end

    respond_to do |format|
      if @debugger.save
        format.html { redirect_to @debugger, notice: 'Debugger was successfully created.' }
        format.json { render :show, status: :created, location: @debugger }
      else
        format.html { render :new }
        format.json { render json: @debugger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debuggers/1
  # PATCH/PUT /debuggers/1.json
  def update
    respond_to do |format|
      if @debugger.update(debugger_params)
        format.html { redirect_to @debugger, notice: 'Debugger was successfully updated.' }
        format.json { render :show, status: :ok, location: @debugger }
      else
        format.html { render :edit }
        format.json { render json: @debugger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debuggers/1
  # DELETE /debuggers/1.json
  def destroy
    @debugger.destroy
    respond_to do |format|
      format.html { redirect_to debuggers_url, notice: 'Debugger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debugger
      @debugger = Debugger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debugger_params
      # params.require(:debugger).permit(:name, :description, :ruby_version_id, :puppet_version_id,  :user_ids => [] )
      params.require(:debugger).permit(:name, :description, :ruby_version_id, :puppet_version_id,  :user_debugger_assignments => [ :user_id, :debugger_id],  :puppet_module_debugger_assignments => [ :puppet_module_id, :debugger_id] )
    end
    # def permitted_params
    #   params.permit(:work => [ :name, :description, :image_id, :standard_ids => [], :area_work_room_assignments_attributes => [ :room_id, :area_id ]])
    # end
end
