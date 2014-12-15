class S2wPullRequest < ActiveRecord::Base
  include PullRequestsHelper
  def get_open_pull_requests
    get_pull_requests_data(S2wRepo, S2wUser, S2wPullRequest)
  end
end
