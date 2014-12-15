json.array!(@s2w_users) do |s2w_user|
  json.extract! s2w_user, :id, :name, :display_name, :last_commented, :last_merged
  json.url s2w_user_url(s2w_user, format: :json)
end
