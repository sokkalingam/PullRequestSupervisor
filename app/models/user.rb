class User < ActiveRecord::Base
	include HTTParty
    
    def get_user_stats
      # get all users
      users = User.all

      # get user events
      users.each{ |user|
        response = HTTParty.get("https://github.paypal.com/api/v3/users/#{user.name}/events")
        if response.code == 200
          user_profile = JSON.parse(HTTParty.get("https://github.paypal.com/api/v3/users/#{user.name}").body)
          user.display_name = user_profile['name']
          user_events = JSON.parse(response.body)
          update_last_commented(user, user_events)
          update_last_merged(user, user_events)
          user.save
        end
      }
    end

    def update_last_commented(user, user_events)
      user_events.each { |event|
        if event['type'] == "IssueCommentEvent" || event['type'] == "PullRequestReviewCommentEvent"
          url = String.new
          url = event['payload']['issue']['url'] if event['type'] == "IssueCommentEvent"
          url = event['payload']['comment']['pull_request_url'] if event['type'] == "PullRequestReviewCommentEvent"
          response = HTTParty.get(url)
          if response.code == 200
            response = JSON.parse(response.body)
            if response['user']['login'] != user.name
              time = Time.parse(event['created_at'])
              user.last_commented = time if user.last_commented == nil
              user.last_commented = time if time > user.last_commented
              break
            end
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
                user.last_merged = time if user.last_merged == nil
                user.last_merged = time if time > user.last_merged
                user.last_commented = user.last_merged if (user.last_commented == nil || user.last_merged > user.last_commented)
                break
              end
            end
          end
      }
    end

end