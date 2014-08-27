class PullRequest < ActiveRecord::Base
  include HTTParty
  
  def get_open_pull_requests
    repos = Repo.all
    users = User.all
    pull_requests = PullRequest.all

    user_names = []
    users.each{ |user|
      user_names << user.name
    }

    pull_requests.each{ |pr|
      response = HTTParty.get(pr.url)
      pull_request = JSON.parse(response.body)
      if pull_request['state'] != 'open'
        pr.destroy
        pr.save
      end
    }

    pull_requests = PullRequest.all
    pull_request_urls = []

    pull_requests.each { |pr|
      pull_request_urls << pr.url
    }


    repos.each{ |repo|
      response = HTTParty.get(repo.url + '/pulls')
      pulls = JSON.parse(response.body)
      pulls.each { |pr| 
        if user_names.include? pr['user']['login']
          unless pull_request_urls.include? pr['url']
            PullRequest.create( :url => pr['url'],
                                :html_url => pr['html_url'],
                                :opened_at => pr['created_at'],
                                :name => pr['user']['login'])
          end
        end
      }

    }

    pull_requests = PullRequest.all

    pull_requests.each do |pr|
      users.each do |user|
        if pr.name == user.name
          pr.display_name = user.display_name
          pr.save
        end
      end
    end

  end
end
