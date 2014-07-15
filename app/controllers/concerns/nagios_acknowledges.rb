module NagiosAcknowledges
  extend ActiveSupport::Concern

  included do
  end

  def acknowledge_services(args = {})
    opts = args.symbolize_keys
    service_ids = opts.fetch(:service_ids)
    comment     = opts.fetch(:comment, "kein Kommentar angegeben")
    services    = Service.find(service_ids)
    services.each do |svc|
      svc.acknowledge_service(comment: comment, author: current_user.username)
    end
  end

  def create_service_tickets(acknowledges, args = {})
    opts = args.symbolize_keys
    service_ids = opts.fetch(:service_ids).map(&:to_i)
    comment     = opts.fetch(:comment, "kein Kommentar angegeben")
    acknowledges.each do |ack|
      next unless service_ids.include?(ack.service_id)
      Ottrick::Ticket.create!(
        ticketfor_id: ack.service_id,
        ticketfor_type: "Service",
        subject: "#{ack.host_name}/#{ack.description}: #{ack.plugin_output}",
        text:    comment,
        sender:  current_user.email,
        otrs_queue_id: ack.site.otrs_queue_id
      )
    end
    acknowledge_services(service_ids: service_ids, comment: comment)
  end


end
