class WelcomeController < ApplicationController

  def index
    @users = User.all
    @pull_requests = PullRequest.all
  end

end