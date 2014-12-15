json.array!(@s2w_pull_requests) do |s2w_pull_request|
  json.extract! s2w_pull_request, :id, :url, :name, :display_name, :html_url, :opened_at
  json.url s2w_pull_request_url(s2w_pull_request, format: :json)
end
