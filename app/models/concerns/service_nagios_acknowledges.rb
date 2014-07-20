module ServiceNagiosAcknowledges
  extend ActiveSupport::Concern

  included do
  end

  def acknowledge_service(args = {})
    args.symbolize_keys!
    conn = Livestatus::Connection.new({uri: self.site.path})
    conn.command(acknowledge_svc_problem(args))
  end

private

  # 40 ACKNOWLEDGE_SVC_PROBLEM;<host_name>;<service_description>;<sticky>;<notify>;<persistent>;<author>;<comment>
  def acknowledge_svc_problem(args)
    comment = args.fetch(:comment)
    sticky  = args.fetch(:sticky, 2)
    notify  = args.fetch(:notify, 1)
    author  = args.fetch(:author, 0)
    persistent = args.fetch(:persistent, 0)

    ["ACKNOWLEDGE_SVC_PROBLEM", host, service_description, sticky, 
      notify, persistent, author, comment].join(';').to_s
  end

end
