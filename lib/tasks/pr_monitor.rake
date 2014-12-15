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
    puts "DemandGenQA Mailer has started"
    PullRequestMailer.review_pull_request_email([10, 13, 16], PullRequest.all, User.all, 'sosubramanian@paypal.com', 'DemandGenQA')
  end

end
