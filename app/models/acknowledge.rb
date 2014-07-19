class Acknowledge
  attr_reader :id, :site, :filter, :live_service

  def initialize(args = {})
    args.symbolize_keys!
    @site    = args.fetch(:site)
    @filter  = args.fetch(:filter)
    @live_service = args.fetch(:live_service)
    @id      = service_id
  end
  delegate :host_name, :description, :state, :plugin_output,
           :last_hard_state_change, :last_time_ok, to: :@live_service

  def self.find(args = {})
    args.symbolize_keys!
    site         = args.fetch(:site)
    filter       = args.fetch(:filter!, Acknowledge.default_filter) + args.fetch(:filter, [])
    connection   = Livestatus::Connection.new({uri: site.path})
    live_services     = connection.get(Livestatus::Service,
                                  Acknowledge.options(filter: filter))
    acknowledges = []
    live_services.each do |live_service|
      acknowledges << self.new(site: site, filter: filter, live_service: live_service)
    end
    acknowledges
  end

  def info
 %Q[\
Host:        #{host_name}
Service:     #{description}
Message:     #{plugin_output}
Status:      #{state.to_s.capitalize}
Last ok:     #{Time.at(last_time_ok).to_date.to_s}
Last change: #{Time.at(last_hard_state_change).to_date.to_s}
]
  end

  def service_id
    Rails.cache.fetch([ self.class.name, @live_service.host_name,
                        @live_service.description, self.site.id ],
                        expires_in: 1.day) {
      Service.find_or_create_by!(site: site, host: @live_service.host_name,
                                 service_description: @live_service.description).try(:id)
    }
  end

private

  def self.options(args = {})
    args.symbolize_keys!
    {
      columns: 'host_name description state plugin_output last_hard_state_change last_time_ok',
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
