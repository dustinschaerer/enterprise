class PuppetVersionsController < ApplicationController
  before_action :set_puppet_version, only: [:show, :edit, :update, :destroy]

  # GET /puppet_versions
  # GET /puppet_versions.json
  def index
    @puppet_versions = PuppetVersion.all
  end

  # GET /puppet_versions/1
  # GET /puppet_versions/1.json
  def show
  end

  # GET /puppet_versions/new
  def new
    @puppet_version = PuppetVersion.new
  end

  # GET /puppet_versions/1/edit
  def edit
  end

  # POST /puppet_versions
  # POST /puppet_versions.json
  def create
    @puppet_version = PuppetVersion.new(puppet_version_params)

    respond_to do |format|
      if @puppet_version.save
        format.html { redirect_to @puppet_version, notice: 'Puppet version was successfully created.' }
        format.json { render :show, status: :created, location: @puppet_version }
      else
        format.html { render :new }
        format.json { render json: @puppet_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puppet_versions/1
  # PATCH/PUT /puppet_versions/1.json
  def update
    respond_to do |format|
      if @puppet_version.update(puppet_version_params)
        format.html { redirect_to @puppet_version, notice: 'Puppet version was successfully updated.' }
        format.json { render :show, status: :ok, location: @puppet_version }
      else
        format.html { render :edit }
        format.json { render json: @puppet_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puppet_versions/1
  # DELETE /puppet_versions/1.json
  def destroy
    @puppet_version.destroy
    respond_to do |format|
      format.html { redirect_to puppet_versions_url, notice: 'Puppet version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puppet_version
      @puppet_version = PuppetVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def puppet_version_params
      params.require(:puppet_version).permit(:version)
    end
end
