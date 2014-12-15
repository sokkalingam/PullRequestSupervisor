namespace :smb do

  task :user => :environment do
    t = Time.now
    SmbUser.new.get_user_stats
    puts "PR Monitor User time taken : #{Time.now - t}"
  end

  task :pr => :environment do
    t = Time.now
    SmbPullRequest.new.get_open_pull_requests
    puts "PR Monitor PR time taken : #{Time.now - t}"
  end

  task :email => :environment do
    puts "Smb Mailer has started"
    PullRequestMailer.review_pull_request_email([10, 13, 23], SmbPullRequest.all, SmbUser.all, 'sosubramanian@paypal.com', 'Smb')
  end

end
