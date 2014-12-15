class SmbController < ApplicationController
  def index
    @users = SmbUser.all.order(:last_commented => :desc, :last_merged => :desc)
    @pull_requests = SmbPullRequest.all.order(:opened_at => :asc)
  end
end
