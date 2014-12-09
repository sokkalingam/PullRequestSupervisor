module PullRequestsHelper
  include HTTParty
  
  @@access_token = "?access_token=792710e6ec06a36b9b7b593d2a5cb2912e44bb14"

  def get_pull_requests_data(repoModel, userModel, pullRequestModel)

    repos = repoModel.all
    users = userModel.all
    pull_requests = pullRequestModel.all

    pull_request_urls = []
    pull_requests.each do |pull_request|
      pull_request_urls << pull_request.url
    end

    repos.each do |repo|
      response = HTTParty.get(repo.url + "/pulls#{@@access_token}")
      if response.code == 200
        pulls = JSON.parse(response.body)
        pulls.each do |pr|
          users.each do |user|
            if user.name == pr['user']['login'] && !(pull_request_urls.include? pr['url'])
                pullRequestModel.create( :url => pr['url'],
                                    :html_url => pr['html_url'],
                                    :opened_at => pr['created_at'],
                                    :name => user.name,
                                    :display_name => user.display_name)
            end
          end
        end
      end
    end




    pull_requests.each do |pull_request|
      respone = HTTParty.get(pull_request.url + @@access_token)
      if respone.code == 200
        if JSON.parse(respone.body)['state'] != 'open'
          pull_request.destroy
          pull_request.save
        end
      end
    end

  end
end
