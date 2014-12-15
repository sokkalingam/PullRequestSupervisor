class PlacesPullRequest < ActiveRecord::Base
  include PullRequestsHelper
  def get_open_pull_requests
    get_pull_requests_data(PlacesRepo, PlacesUser, PlacesPullRequest)
  end
end
