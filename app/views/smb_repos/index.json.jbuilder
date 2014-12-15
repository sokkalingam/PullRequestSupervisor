json.array!(@smb_repos) do |smb_repo|
  json.extract! smb_repo, :id, :url
  json.url smb_repo_url(smb_repo, format: :json)
end
