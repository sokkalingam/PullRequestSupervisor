json.array!(@repos) do |repo|
  json.extract! repo, :id, :url
  json.url repo_url(repo, format: :json)
end
