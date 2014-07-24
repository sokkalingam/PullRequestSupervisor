namespace :pr do

  task :monitor => :environment do
    while (true) do
      User.new.get_user_stats
      PullRequest.new.get_open_pull_requests
      puts "PR Monitor Last Updated at : " + Time.now.in_time_zone("Eastern Time (US & Canada)").to_s
    end
  end

  task :email => :environment do
    puts "Mailer has started"
    while (true) do
      time_now = Time.now.in_time_zone("Eastern Time (US & Canada)").to_s
      if time_now.include?("10:00:00") || time_now.include?("13:00:00") || time_now.include?("16:00:00")
        PullRequest.new.pull_request_mailer
        puts "Email sent at : " + time_now
        sleep(10)
      end
    end
  end

end