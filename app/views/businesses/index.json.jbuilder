json.array!(@businesses) do |business|
  json.extract! business, :name, :logo, :email, :street_address, :phone, :manager, :reward, :req_visits, :marketing_package, :photo
  json.url business_url(business, format: :json)
end