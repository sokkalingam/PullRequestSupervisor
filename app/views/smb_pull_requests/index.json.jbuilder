json.array!(@smb_pull_requests) do |smb_pull_request|
  json.extract! smb_pull_request, :id, :url, :name, :display_name, :html_url, :opened_at
  json.url smb_pull_request_url(smb_pull_request, format: :json)
end
