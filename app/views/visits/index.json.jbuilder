json.array!(@visits) do |visit|
  json.extract! visit, :business_id, :customer_id
  json.url visit_url(visit, format: :json)
end