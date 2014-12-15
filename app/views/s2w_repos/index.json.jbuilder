json.array!(@s2w_repos) do |s2w_repo|
  json.extract! s2w_repo, :id, :url
  json.url s2w_repo_url(s2w_repo, format: :json)
end
