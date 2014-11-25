namespace :monitor do

  task :user => :environment do
    t = Time.now
    User.new.get_user_stats
    puts "PR Monitor User time taken : #{Time.now - t}"
  end

  task :pr => :environment do
    t = Time.now
    PullRequest.new.get_open_pull_requests
    puts "PR Monitor PR time taken : #{Time.now - t}"
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
