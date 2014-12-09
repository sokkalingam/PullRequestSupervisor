json.array!(@shop_users) do |shop_user|
  json.extract! shop_user, :id, :name, :last_commented, :last_merged, :display_name
  json.url shop_user_url(shop_user, format: :json)
end
