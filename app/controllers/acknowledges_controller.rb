class AcknowledgesController < ApplicationController
  before_action :get_site, only: [:index]
  before_action :find_acknowledges, only: [:index]

  # GET /acknowledges
  def index
    respond_with(@acknowledges)
  end

  private

  def get_site
    @site = Site.where(["name = :site or id = :site", site: params.fetch(:site)]).first
  end

  def find_acknowledges
    @acknowledges = Acknowledge.find(site: @site)
  end

end
