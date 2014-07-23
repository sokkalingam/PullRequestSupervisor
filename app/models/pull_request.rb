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
      response = HTTParty.get(repo.url + '/pulls?access_token=792710e6ec06a36b9b7b593d2a5cb2912e44bb14')
      pulls = JSON.parse(response.body)
      pulls.each { |pr| 
        if user_names.include? pr['user']['login']
          unless pull_request_urls.include? pr['url']
            PullRequest.create( :url => pr['url'],
                                :html_url => pr['html_url'],
                                :opened_at => pr['created_at'])
          end
        end
      }

    }

  end

  def pull_request_mailer
    pull_requests = PullRequest.all
    if pull_requests.length > 0
      PullRequestMailer.review_pull_request_email(pull_requests).deliver
      puts "PullRequestMailer Email Sent"
    end
  end
end
