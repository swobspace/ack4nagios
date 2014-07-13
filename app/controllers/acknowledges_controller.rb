class AcknowledgesController < ApplicationController
  before_action :get_site, only: [:index]
  before_action :find_acknowledges, only: [:index]

  # GET /acknowledges
  def index
    @filter = params[:filter]
    respond_with(@acknowledges)
  end

  def create
    if service_ids.empty?
      redirect_to filter_params.merge(action: :index)
    end
    if commit == 'Ticket'
    elsif commit == 'Mail'
    elsif commit == 'Acknowledge'
    elsif commit == 'Test'
      @params = acknowledge_params.merge(commit: commit)
      render :create
    end
  end

  private

  def get_site
    @site = Site.where(["name = :site or id = :site", site: params.fetch(:site)]).first
  end

  def find_acknowledges
    @acknowledges = Acknowledge.find(site: @site, filter: filter)
  end

  def acknowledge_params
    params.permit(:site, :comment, {service_ids: []})
  end

  def filter_params
    params.permit(:site, :filter)
  end

  def service_ids
    params[:service_ids] || []
  end

  # Syntax for livestatus filters:
  # field_tag1:field_value1;...;field_tagN:field_valueN
  # result: [ "field_tag1 = field_value1", ..., "fieldfield_tagN = field_valueN" ]
  #
  def filter
    if params[:filter].blank?
      []
    else
      params[:filter].gsub(/:/, " = ").split(/;/)
    end
  end

  def commit
    params[:commit]
  end
end
