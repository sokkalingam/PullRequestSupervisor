class PullRequestMailer < ActionMailer::Base
  default from: "supervisor@prmonitor.com"

  def review_pull_request_email(pull_requests)
    @pull_requests = pull_requests
    mail(to: 'DL-PP-CQES-DemandGen@ebay.com', content_type: "text/html", subject: 'Would you like to review some Pull Requests?')
  end
end
