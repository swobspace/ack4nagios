json.array!(@services) do |service|
  json.extract! service, :id, :site, :host, :service_description
  json.url service_url(service, format: :json)
end
