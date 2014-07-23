namespace :monitor do
  task :pull => :environment do
    user  = User.new
    pr    = PullRequest.new
    while (true) do
      user.get_user_stats
      pr.get_open_pull_requests
      time_now = Time.now.in_time_zone("Eastern Time (US & Canada)").to_s
      if time_now.include?("10:00:") || time_now.include?("16:00:")
        pr.pull_request_mailer
        sleep(60)
      end
      puts "PR Monitor Last Updated at : " + time_now
    end
  end
end