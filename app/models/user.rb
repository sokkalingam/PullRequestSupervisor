class User < ActiveRecord::Base
	include HTTParty
    
    def get_user_stats
      # get all users
      users = User.all

      # get user events
      users.each{ |user|
        response = HTTParty.get("https://github.paypal.com/api/v3/users/#{user.name}/events")
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
            if time > user.last_commented
              user.last_commented = time
              user.save
            end
          end
      }
    end

    def update_last_merged(user, user_events)
      user_events.each { |event|
          if event['type'] == "PullRequestEvent"
            if event['payload']['pull_request']['merged'] == true
              if event['payload']['pull_request']['merged_by']['login'] == user.name
                time = Time.parse(event['created_at'])
                if time > user.last_merged
                  user.last_merged = time
                  user.save
                end
              end
            end
          end
      }
    end

end