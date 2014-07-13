module NagiosAcknowledges
  extend ActiveSupport::Concern

  included do
  end

  def acknowledge_services(args = {})
    opts = args.symbolize_keys
    service_ids = opts.fetch(:service_ids)
    comment     = opts.fetch(:comment)
    services    = Service.find(service_ids)
    services.each do |svc|
      svc.acknowledge_service(comment: comment, author: current_user.username)
    end
  end

end
