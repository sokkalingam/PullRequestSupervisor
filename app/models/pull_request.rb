class PullRequest < ActiveRecord::Base
  include PullRequestsHelper

  def get_open_pull_requests
    get_pull_requests_data(Repo, User, PullRequest)
  end

end
