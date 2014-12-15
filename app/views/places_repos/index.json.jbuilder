json.array!(@places_repos) do |places_repo|
  json.extract! places_repo, :id, :url
  json.url places_repo_url(places_repo, format: :json)
end
