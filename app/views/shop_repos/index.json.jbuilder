json.array!(@shop_repos) do |shop_repo|
  json.extract! shop_repo, :id, :url
  json.url shop_repo_url(shop_repo, format: :json)
end
