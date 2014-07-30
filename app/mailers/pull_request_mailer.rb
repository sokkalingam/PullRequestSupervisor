class PullRequestMailer < ActionMailer::Base
  default from: "do-not-reply@paypal.com"

  def send_email
    @pull_requests = PullRequest.all.order(:opened_at => :asc)
    @users = User.all.order(:last_commented => :desc).limit(3)
    mail(to: 'DL-PP-CQES-DemandGen@ebay.com', content_type: "text/html", subject: 'Would you like to review some Pull Requests?')
  end

  def review_pull_request_email
    send_email().deliver if PullRequest.all.length > 0
  end

end
