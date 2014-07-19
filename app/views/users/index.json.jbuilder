json.array!(@users) do |user|
  json.extract! user, :id, :name, :last_commented, :last_merged
  json.url user_url(user, format: :json)
end
