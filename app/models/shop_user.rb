class ShopUser < ActiveRecord::Base
  include UsersHelper

  def get_user_stats
    get_user_data(ShopUser.all)
  end
end
