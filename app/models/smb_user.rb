class SmbUser < ActiveRecord::Base
  include UsersHelper
  def get_user_stats
    get_user_data(SmbUser.all)
  end
end
