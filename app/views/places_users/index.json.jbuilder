json.array!(@places_users) do |places_user|
  json.extract! places_user, :id, :name, :display_name, :last_commented, :last_merged
  json.url places_user_url(places_user, format: :json)
end
