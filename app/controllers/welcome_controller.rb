class WelcomeController < ApplicationController

  def index
    @users = User.all.order(:last_commented => :desc, :last_merged => :desc)
    @pull_requests = PullRequest.all.order(:opened_at => :asc)
  end

end