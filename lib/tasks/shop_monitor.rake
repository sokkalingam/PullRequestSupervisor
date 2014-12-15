namespace :shop do

  task :user => :environment do
    t = Time.now
    ShopUser.new.get_user_stats
    puts "PR Monitor User time taken : #{Time.now - t}"
  end

  task :pr => :environment do
    t = Time.now
    ShopPullRequest.new.get_open_pull_requests
    puts "PR Monitor PR time taken : #{Time.now - t}"
  end

  task :email => :environment do
    puts "Shop Mailer has started"
    PullRequestMailer.review_pull_request_email([10, 13], ShopPullRequest.all, ShopUser.all, 'sosubramanian@paypal.com', 'Shop')
  end

end