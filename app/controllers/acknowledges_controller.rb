class AcknowledgesController < ApplicationController
  include NagiosAcknowledges

  before_action :get_site, only: [:index, :create]
  before_action :find_acknowledges, only: [:index, :create]

  # GET /acknowledges
  def index
    @filter = params[:filter]
    respond_with(@acknowledges)
  end

  def create
    @errors  = []
    @success = []
    @params = acknowledge_params
    if service_ids.empty?
      flash[:notice] = t('ack4nagios.no_checkbox_set')
    else
      if acktion == 'ticket'
        if defined? Ottrick
          if merge_acks
	    create_merged_ticket(@acknowledges, ack_params)
          else
	    create_service_tickets(@acknowledges, ack_params)
          end
        else
          raise RuntimeError, "Ottrick is not yet available"
        end
      elsif acktion == 'mail'
      elsif acktion == 'ack'
	acknowledge_services(ack_params)
      elsif acktion == 'test'
      end
      if @errors.any?
	flash[:error] = @errors.join("\n")
      end
      if @success.any?
	flash[:success] = @success.join("\n")
      end
    end
    respond_to do |format|
      format.html { 
        if acktion == 'test'
          render :create
        else
          sleep 2
          redirect_to main_app.url_for(filter_params.merge(action: :index)) 
        end
      }
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
    params.permit(
      :site, :comment, {service_ids: []}, :merge, :filter, :acktion,
      :utf8, :authenticity_token, :commit, :checkAll,
      :dataTable_length, :idx0, :idx1, :idx2, :idx3, :idx4, :idx5, :idx6, :idx7
    )
  end
 
  def ack_params
    acknowledge_params.slice(:site, :comment, :service_ids, :merge).to_hash
  end

  def filter_params
    acknowledge_params.slice(:site, :filter).to_hash
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

  def acktion
    params[:acktion]
  end

  def merge_acks
    params[:merge].to_i == 1
  end

end
