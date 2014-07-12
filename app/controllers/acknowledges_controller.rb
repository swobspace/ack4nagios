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
    @acknowledges = connection.get(Livestatus::Service, options)
  end

  def connection
    @connection ||= Livestatus::Connection.new({uri: @site.path})
  end

  def options
    { 
      columns: 'host_name description state plugin_output',
      filter: [
        "host_state = 0",
        "host_state_type = 1",
        "state > 0",
        "state_type = 1",
        "acknowledged = 0"
      ]
    }
  end

end
