class SmbPullRequest < ActiveRecord::Base
  include PullRequestsHelper
  def get_open_pull_requests
    get_pull_requests_data(SmbRepo, SmbUser, SmbPullRequest)
  end
end
