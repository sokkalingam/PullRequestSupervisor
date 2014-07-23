class PullRequestMailer < ActionMailer::Base
  default from: "supervisor@prmonitor.com"

  def review_pull_request_email(pull_requests)
    @pull_requests = pull_requests
    mail(to: 'sosubramanian@paypal.com', content_type: "text/html", subject: 'Would you like to review some Pull Requests?')
  end
end
