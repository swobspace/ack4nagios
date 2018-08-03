module NagiosAcknowledges
  extend ActiveSupport::Concern
  include ActionView::Helpers::UrlHelper
  include Ottrick::TicketsHelper if defined? Ottrick

  included do
  end

  def acknowledge_services(args = {})
    opts = args.symbolize_keys
    service_ids = opts.fetch(:service_ids)
    comment     = opts.fetch(:comment, "")
    flash       = opts.fetch(:flash, true)
    comment     = "Kein Kommentar angegeben" if comment.blank?
    services    = Service.find(service_ids)
    services.each do |svc|
      svc.acknowledge_service(comment: comment, author: current_user.username)
    end
    if flash
      @success << t('ack4nagios.acknowledges_set')
    end
  end

  if defined? Ottrick
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
		      t('ack4nagios.ticket_created',
			ticketnumber: otrs_ticket_link(ticket, :number))
	else
	  errors = t('ack4nagios.no_ticket_created') + ' '
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
	@errors << t('ack4nagios.no_comment_created')
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
	@success << t('ack4nagios.ticket_created',
		       ticketnumber: otrs_ticket_link(ticket, :number))
	acknowledge_services(service_ids: service_ids, comment: comment, flash: false)
      else
	errors = t('ack4nagios.no_ticket_created') + ' '
	if ticket.errors.any?
	  errors += ticket.errors.full_messages.join("; ")
	end
	@errors << errors
      end
    end
  end
end
