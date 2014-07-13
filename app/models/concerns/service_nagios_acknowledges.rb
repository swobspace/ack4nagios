module ServiceNagiosAcknowledges
  extend ActiveSupport::Concern

  included do
  end

  def acknowledge_service(args = {})
    args.symbolize_keys!
    conn = Livestatus::Connection.new({uri: self.site.path})
    conn.command(command(args))
  end

private

  # 40 ACKNOWLEDGE_SVC_PROBLEM;<host_name>;<service_description>;<sticky>;<notify>;<persistent>;<author>;<comment>
  def command(args)
    comment = args.fetch(:comment)
    sticky  = 0
    notify  = 0
    author  = 0
    persistent = 0

    ["ACKNOWLEDGE_SVC_PROBLEM", host, service_description, sticky, 
      notify, persistent, author, comment].join(';').to_s
  end

end
