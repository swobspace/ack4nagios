json.array!(@acknowledges) do |acknowledge|
  json.extract! acknowledge, :id, :host_name, :description, :state, :plugin_output
  # json.url acknowledge_url(acknowledge, format: :json)
end
