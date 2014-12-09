class ShopController < ApplicationController

  def index
    @users = ShopUser.all.order(:last_commented => :desc, :last_merged => :desc)
    @pull_requests = ShopPullRequest.all.order(:opened_at => :asc)
  end

end