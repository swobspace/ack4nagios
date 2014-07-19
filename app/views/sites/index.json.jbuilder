json.array!(@sites) do |site|
  json.extract! site, :id, :name, :connection_type, :uri, :otrs_queue_id, :nagios_service_url
  json.url site_url(site, format: :json)
end
