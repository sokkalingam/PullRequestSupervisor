namespace :places do

  task :user => :environment do
    t = Time.now
    PlacesUser.new.get_user_stats
    puts "PR Monitor User time taken : #{Time.now - t}"
  end

  task :pr => :environment do
    t = Time.now
    PlacesPullRequest.new.get_open_pull_requests
    puts "PR Monitor PR time taken : #{Time.now - t}"
  end

  task :email => :environment do
    puts "Places Mailer has started"
    PullRequestMailer.review_pull_request_email([10, 13], PlacesPullRequest.all, PlacesUser.all, 'sosubramanian@paypal.com', 'Places')
  end

end
