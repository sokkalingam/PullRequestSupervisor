class PlacesController < ApplicationController
  def index
    @users = PlacesUser.all.order(:last_commented => :desc, :last_merged => :desc)
    @pull_requests = PlacesPullRequest.all.order(:opened_at => :asc)
  end
end
