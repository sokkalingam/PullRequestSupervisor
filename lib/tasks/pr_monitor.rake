namespace :pr do

  task :monitor => :environment do
    user = User.new
    pull_request = PullRequest.new
    user.get_user_stats
    pull_request.get_open_pull_requests
    puts "PR Monitor Last Updated at : " + Time.now.in_time_zone("Eastern Time (US & Canada)").to_s
  end

  task :email => :environment do
    puts "Mailer has started"
    mailer(10)
    mailer(13)
    mailer(16)
  end

  def mailer(hr, min = 0)
    time_now = Time.now.in_time_zone("Eastern Time (US & Canada)")
    if time_now.hour == hr && time_now.min == min
      if !(time_now.saturday? || time_now.sunday?)
        PullRequestMailer.review_pull_request_email
        puts "Email sent at : " + time_now.to_s
      end
    end
  end

end
