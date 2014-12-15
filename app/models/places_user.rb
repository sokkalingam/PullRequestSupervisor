class PlacesUser < ActiveRecord::Base
  include UsersHelper
  def get_user_stats
    get_user_data(PlacesUser.all)
  end
end
