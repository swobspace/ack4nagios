json.array!(@acknowledges) do |acknowledge|
  json.extract! acknowledge, :id, :index
  json.url acknowledge_url(acknowledge, format: :json)
end
