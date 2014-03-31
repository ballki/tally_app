json.array!(@rewards) do |reward|
  json.extract! reward, :business_id, :customer_id, :reward, :redeemed, :redeemed_at
  json.url reward_url(reward, format: :json)
end