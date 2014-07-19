class PullRequestJob
  @queue = :pull_request

  def self.perform(min)
  	sleep(min)
    PullRequest.new.get_open_pull_requests
    puts "Pull Request Job It Is!"
  end

end