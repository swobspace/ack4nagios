module NagiosAcknowledges
  extend ActiveSupport::Concern
  include ActionView::Helpers::UrlHelper
  include Ottrick::TicketsHelper

  included do
  end

  def acknowledge_services(args = {})
    opts = args.symbolize_keys
    service_ids = opts.fetch(:service_ids)
    comment     = opts.fetch(:comment, "")
    comment     = "Kein Kommentar angegeben" if comment.blank?
    services    = Service.find(service_ids)
    services.each do |svc|
      svc.acknowledge_service(comment: comment, author: current_user.username)
    end
  end

  def create_service_tickets(acknowledges, args = {})
    opts = args.symbolize_keys
    service_ids = opts.fetch(:service_ids).map(&:to_i)
    comment     = opts.fetch(:comment, "")
    comment     = "Kein Kommentar angegeben" if comment.blank?
    acknowledges.each do |ack|
      next unless service_ids.include?(ack.service_id)
      ticket = Ottrick::Ticket.create(
        ticketfor_id: ack.service_id,
        ticketfor_type: "Service",
        subject: "#{ack.host_name}/#{ack.description}: #{ack.plugin_output}",
        text:    comment + "\n\n" + ack.info,
        sender:  current_user.email,
        otrs_queue_id: ack.site.otrs_queue_id
      )
      if ticket.persisted?
        comment += "; Ticket-Nummer " + otrs_ticket_link(ticket, :number).html_safe
        ticket.ticketfor.acknowledge_service(comment: comment, author: current_user.username)
        @success << "#{ack.host_name}/#{ack.description}: " +
                    "Ticket #{otrs_ticket_link(ticket, :number)} angelegt"
      else
        errors = "Ticket konnte nicht angelegt werden: "
        if ticket.errors.any?
          errors += ticket.errors.full_messages.join("; ")
        end
        @errors << errors
      end
    end
  end

  def create_merged_ticket(acknowledges, args = {})
    opts = args.symbolize_keys
    site        = Site.find(opts.fetch(:site))
    service_ids = opts.fetch(:service_ids).map(&:to_i)
    comment     = opts.fetch(:comment, "")
    if comment.blank?
      @errors << "Kein Kommentar angegeben, wird als Subject für das Ticket gebraucht"
      return
    end

    # -- get all infos
    ticket_body = ""
    acknowledges.each do |ack|
      next unless service_ids.include?(ack.service_id)
      ticket_body += ack.info + "\n\n"
    end

    ticket = Ottrick::Ticket.create(
      subject: "#{comment}",
      text:    "#{ticket_body}",
      sender:  current_user.email,
      otrs_queue_id: site.otrs_queue_id
    )
    if ticket.persisted?
      comment += "; Ticket-Nummer " + otrs_ticket_link(ticket, :number).html_safe
      @success << "Ticket #{otrs_ticket_link(ticket, :number)} angelegt"
      acknowledge_services(service_ids: service_ids, comment: comment)
    else
      errors = "Ticket konnte nicht angelegt werden: "
      if ticket.errors.any?
	errors += ticket.errors.full_messages.join("; ")
      end
      @errors << errors
    end
  end


end
