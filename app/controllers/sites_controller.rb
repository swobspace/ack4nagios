class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumb_show, only: [:show]

  # GET /sites
  def index
    @sites = Site.all
    respond_with(@sites)
  end

  # GET /sites/1
  def show
    respond_with(@site)
  end

  # GET /sites/new
  def new
    @site = Site.new
    respond_with(@site)
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

    @site.save
    respond_with(@site)
  end

  # PATCH/PUT /sites/1
  def update
    @site.update(site_params)
    respond_with(@site)
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
    respond_with(@site)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_params
      params.require(:site).permit(
        :name, :connection_type, :uri, :otrs_queue_id, :nagios_service_url
      )
    end
end
