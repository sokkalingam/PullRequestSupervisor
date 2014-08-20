namespace :pr do

  task :monitor => :environment do
    user = User.new
    pull_request = PullRequest.new
    while (true) do
      user.get_user_stats
      pull_request.get_open_pull_requests
      puts "PR Monitor Last Updated at : " + Time.now.in_time_zone("Eastern Time (US & Canada)").to_s
    end
  end

  task :email => :environment do
    puts "Mailer has started"
    while (true) do
      mailer("10:00:00", 3)
      mailer("13:00:00", 3)
      mailer("16:00:00", 18)
    end
  end

  def mailer(time_to_send, sleep_for)
    time_now = Time.now.in_time_zone("Eastern Time (US & Canada)")
    if time_now.to_s.include?(time_to_send)
      if !(time_now.saturday? || time_now.sunday?)
        PullRequestMailer.review_pull_request_email
        puts "Email sent at : " + time_now.to_s
      end
      puts "Sleeping for #{sleep_for} hours"
      sleep(sleep_for.hours - 3.seconds)
    end
  end

end