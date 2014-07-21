class User < ActiveRecord::Base
	include HTTParty
    
    def get_user_stats
      # get all users
      users = User.all

      # get user events
      users.each{ |user|
        response = HTTParty.get("https://github.paypal.com/api/v3/users/#{user.name}/events?access_token=792710e6ec06a36b9b7b593d2a5cb2912e44bb14")
        if response.code == 200
          user_events = JSON.parse(response.body)
          update_last_commented(user, user_events)
          update_last_merged(user, user_events)
        end
      }
    end

    def update_last_commented(user, user_events)
      user_events.each { |event|
          if event['type'] == "IssueCommentEvent" || event['type'] == "PullRequestReviewCommentEvent"
            time = Time.parse(event['created_at'])
            user.last_commented = time if user.last_commented == nil
            user.last_commented = time if time > user.last_commented
            user.save
          end
      }
    end

    def update_last_merged(user, user_events)
      user_events.each { |event|
          if event['type'] == "PullRequestEvent"
            if event['payload']['pull_request']['merged'] == true
              if event['payload']['pull_request']['merged_by']['login'] == user.name
                time = Time.parse(event['created_at'])
                user.last_merged = time if user.last_merged == nil
                user.last_merged = time if time > user.last_merged
                user.save
              end
            end
          end
      }
    end

end