module UsersHelper
  include HTTParty

    @@access_token = "?access_token=792710e6ec06a36b9b7b593d2a5cb2912e44bb14"

    def get_user_data(users)

      # get user events
      users.each{ |user|
        response = HTTParty.get("https://github.paypal.com/api/v3/users/#{user.name}/events#{@@access_token}")
        if response.code == 200
          user_profile = JSON.parse(HTTParty.get("https://github.paypal.com/api/v3/users/#{user.name}#{@@access_token}").body)
          user.display_name = user_profile['name']
          user.display_name = user.name if user.display_name.blank?
          user_events = JSON.parse(response.body)
          update_last_commented(user, user_events)
          update_last_merged(user, user_events)
        end
      }
    end

    def update_last_commented(user, user_events)
      user_events.each { |event|
        if event['type'] == "IssueCommentEvent" || event['type'] == "PullRequestReviewCommentEvent"
          url = String.new
          url = event['payload']['issue']['url'] if event['type'] == "IssueCommentEvent"
          url = event['payload']['comment']['pull_request_url'] if event['type'] == "PullRequestReviewCommentEvent"
          response = HTTParty.get(url + @@access_token)
          if response.code == 200
            response = JSON.parse(response.body)
            if response['user']['login'] != user.name
              time = Time.parse(event['created_at'])
              if user.last_commented == nil || time > user.last_commented
                user.last_commented = time
                user.save
                break
              end
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
                if user.last_merged == nil || time > user.last_merged
                  user.last_merged = time
                  user.last_commented = user.last_merged if user.last_merged > user.last_commented
                  user.save
                  break
                end
              end
            end
          end
      }
    end
end
