namespace :s2w do

  task :user => :environment do
    t = Time.now
    S2wUser.new.get_user_stats
    puts "PR Monitor User time taken : #{Time.now - t}"
  end

  task :pr => :environment do
    t = Time.now
    S2wPullRequest.new.get_open_pull_requests
    puts "PR Monitor PR time taken : #{Time.now - t}"
  end

  task :email => :environment do
    puts "S2w Mailer has started"
    PullRequestMailer.review_pull_request_email([10, 13, 23], S2wPullRequest.all, S2wUser.all, 'sosubramanian@paypal.com', 'S2w')
  end

end
