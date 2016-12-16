class PuppetModulesController < ApplicationController
  before_action :set_puppet_module, only: [:show, :edit, :update, :destroy]

  # GET /puppet_modules
  # GET /puppet_modules.json
  def index
    @puppet_modules = PuppetModule.all
  end

  # GET /puppet_modules/1
  # GET /puppet_modules/1.json
  def show
  end

  # GET /puppet_modules/new
  def new
    @puppet_module = PuppetModule.new
  end

  # GET /puppet_modules/1/edit
  def edit
  end

  # POST /puppet_modules
  # POST /puppet_modules.json
  def create
    @puppet_module = PuppetModule.new(puppet_module_params)

    respond_to do |format|
      if @puppet_module.save
        format.html { redirect_to @puppet_module, notice: 'Puppet module was successfully created.' }
        format.json { render :show, status: :created, location: @puppet_module }
      else
        format.html { render :new }
        format.json { render json: @puppet_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puppet_modules/1
  # PATCH/PUT /puppet_modules/1.json
  def update
    respond_to do |format|
      if @puppet_module.update(puppet_module_params)
        format.html { redirect_to @puppet_module, notice: 'Puppet module was successfully updated.' }
        format.json { render :show, status: :ok, location: @puppet_module }
      else
        format.html { render :edit }
        format.json { render json: @puppet_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puppet_modules/1
  # DELETE /puppet_modules/1.json
  def destroy
    @puppet_module.destroy
    respond_to do |format|
      format.html { redirect_to puppet_modules_url, notice: 'Puppet module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puppet_module
      @puppet_module = PuppetModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def puppet_module_params
      params.require(:puppet_module).permit(:name, :version, :version_release_date, :owner, :slug, :uri)
    end
end
