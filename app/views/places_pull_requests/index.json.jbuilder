json.array!(@places_pull_requests) do |places_pull_request|
  json.extract! places_pull_request, :id, :url, :name, :display_name, :html_url, :opened_at
  json.url places_pull_request_url(places_pull_request, format: :json)
end
