class PullRequestMailer < ActionMailer::Base
  default from: "do-not-reply@paypal.com"

  def send_email(pull_requests, users, to, teamName)
    @teamName = teamName.downcase
    @pull_requests = pull_requests.order(:opened_at => :asc)
    @users = users.order(:last_commented => :desc).limit(3)
    mail(to: to, content_type: "text/html", subject: 'Would you like to review some Pull Requests for ' + teamName + '?')
  end

  def review_pull_request_email(hours, pull_requests, users, to, teamName)
    puts "Inside Mailer"
    time_now = Time.now.in_time_zone("Eastern Time (US & Canada)")
    if pull_requests.length > 0
      if hours.include?(time_now.hour) && time_now.min == 40
        if !(time_now.saturday? || time_now.sunday?)
          send_email(pull_requests, users, to, teamName).deliver
          puts "Email sent at : " + time_now.to_s
        end
      end
    end
  end

end
