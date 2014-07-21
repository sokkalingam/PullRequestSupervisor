namespace :monitor do
  task :pull => :environment do
    while (true) do
      # User.new.get_user_stats
      # PullRequest.new.get_open_pull_requests
      puts "PR Monitor Last Updated at : " + Time.now.strftime("%M/%D/%Y %I:%M%p")
      # sleep(60)
    end
  end
end