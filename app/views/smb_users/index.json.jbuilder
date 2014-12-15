json.array!(@smb_users) do |smb_user|
  json.extract! smb_user, :id, :name, :display_name, :last_commented, :last_merged
  json.url smb_user_url(smb_user, format: :json)
end
