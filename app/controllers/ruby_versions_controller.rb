class RubyVersionsController < ApplicationController
  before_action :set_ruby_version, only: [:show, :edit, :update, :destroy]

  # GET /ruby_versions
  # GET /ruby_versions.json
  def index
    @ruby_versions = RubyVersion.all
  end

  # GET /ruby_versions/1
  # GET /ruby_versions/1.json
  def show
  end

  # GET /ruby_versions/new
  def new
    @ruby_version = RubyVersion.new
  end

  # GET /ruby_versions/1/edit
  def edit
  end

  # POST /ruby_versions
  # POST /ruby_versions.json
  def create
    @ruby_version = RubyVersion.new(ruby_version_params)

    respond_to do |format|
      if @ruby_version.save
        format.html { redirect_to @ruby_version, notice: 'Ruby version was successfully created.' }
        format.json { render :show, status: :created, location: @ruby_version }
      else
        format.html { render :new }
        format.json { render json: @ruby_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruby_versions/1
  # PATCH/PUT /ruby_versions/1.json
  def update
    respond_to do |format|
      if @ruby_version.update(ruby_version_params)
        format.html { redirect_to @ruby_version, notice: 'Ruby version was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruby_version }
      else
        format.html { render :edit }
        format.json { render json: @ruby_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruby_versions/1
  # DELETE /ruby_versions/1.json
  def destroy
    @ruby_version.destroy
    respond_to do |format|
      format.html { redirect_to ruby_versions_url, notice: 'Ruby version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruby_version
      @ruby_version = RubyVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruby_version_params
      params.require(:ruby_version).permit(:version)
    end
end
