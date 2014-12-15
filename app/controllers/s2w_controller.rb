class S2wController < ApplicationController
  def index
    @users = S2wUser.all.order(:last_commented => :desc, :last_merged => :desc)
    @pull_requests = S2wPullRequest.all.order(:opened_at => :asc)
  end
end
