json.array!(@shop_pull_requests) do |shop_pull_request|
  json.extract! shop_pull_request, :id, :url, :opened_at, :html_url, :name, :display_name
  json.url shop_pull_request_url(shop_pull_request, format: :json)
end
