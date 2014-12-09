class User < ActiveRecord::Base
  include UsersHelper

	def get_user_stats
    get_user_data(User.all)
  end
end