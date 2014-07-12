class Acknowledge
  attr_reader :site, :filter

  def initialize(args = {})
    args.symbolize_keys!
    @site    = args.fetch(:site)
    @filter  = args.fetch(:filter)
    @service = args.fetch(:service)
  end
  delegate :host_name, :description, :state, :plugin_output, to: :@service

  def self.find(args = {})
    args.symbolize_keys!
    site         = args.fetch(:site)
    filter       = args.fetch(:filter, Acknowledge.default_filter)
    connection   = Livestatus::Connection.new({uri: site.path})
    services     = connection.get(Livestatus::Service, 
                                  Acknowledge.options(filter: filter))
    acknowledges = []
    services.each do |service|
      acknowledges << self.new(site: site, filter: filter, service: service) 
    end
    acknowledges
  end

private

  def self.options(args = {})
    args.symbolize_keys!
    { 
      columns: 'host_name description state plugin_output',
      filter: args.fetch(:filter)
    }
  end

  def self.default_filter
    [
      "host_state = 0",
      "host_state_type = 1",
      "state > 0",
      "state_type = 1",
      "acknowledged = 0"
    ]
  end


end
