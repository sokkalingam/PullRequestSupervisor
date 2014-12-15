#!/bin/bash
# Takes one parameter which is the team name
name=`echo "print '$1'.downcase" | ruby`

## Generate scaffolds for Users, PullRequests and Repos
rails generate scaffold ${1}User name:string display_name:string last_commented:datetime last_merged:datetime 
rails generate scaffold ${1}PullRequest url:string name:string display_name:string html_url:string opened_at:datetime
rails generate scaffold ${1}Repo url:string

## Update Models
  
user="class ${1}User < ActiveRecord::Base
  include UsersHelper
  def get_user_stats
    get_user_data(${1}User.all)
  end
end"
echo "$user" > app/models/${name}_user.rb

pull_request="class ${1}PullRequest < ActiveRecord::Base
  include PullRequestsHelper
  def get_open_pull_requests
    get_pull_requests_data(${1}Repo, ${1}User, ${1}PullRequest)
  end
end"
echo "$pull_request" > app/models/${name}_pull_request.rb

## Create Controllers

controller="class ${1}Controller < ApplicationController
  def index
    @users = ${1}User.all.order(:last_commented => :desc, :last_merged => :desc)
    @pull_requests = ${1}PullRequest.all.order(:opened_at => :asc)
  end
end"
echo "$controller" > app/controllers/${name}_controller.rb

## Create view

mkdir app/views/${name}
html="<%= render :partial => \"shared/index\" %>"
echo "$html" > app/views/${name}/index.html.erb

## Create Rake
rake="namespace :${name} do

  task :user => :environment do
    t = Time.now
    ${1}User.new.get_user_stats
    puts \"PR Monitor User time taken : #{Time.now - t}\"
  end

  task :pr => :environment do
    t = Time.now
    ${1}PullRequest.new.get_open_pull_requests
    puts \"PR Monitor PR time taken : #{Time.now - t}\"
  end

  task :email => :environment do
    puts \"${1} Mailer has started\"
    PullRequestMailer.review_pull_request_email([10, 13], ${1}PullRequest.all, ${1}User.all, '${2}', '${1}')
  end

end"
echo "$rake" > lib/tasks/${name}_monitor.rake

## Create shell scripts
sed '$d' run_scripts/run_monitor_user.sh > run_scripts/run_${name}_user.sh
echo "rake ${name}:user > run_scripts/logs/${name}_user.log" >> run_scripts/run_${name}_user.sh 

sed '$d' run_scripts/run_monitor_pr.sh > run_scripts/run_${name}_pr.sh
echo "rake ${name}:pr > run_scripts/logs/${name}_pr.log" >> run_scripts/run_${name}_pr.sh

sed '$d' run_scripts/run_monitor_email.sh > run_scripts/run_${name}_email.sh
echo "rake ${name}:email > run_scripts/logs/${name}_email.log" >> run_scripts/run_${name}_email.sh

## Setup Routes
sed '$d' config/routes.rb > config/temp.rb
routes="  get '/${name}',        to: '${name}#index'
end"
echo "$routes" >> config/temp.rb
cat config/temp.rb > config/routes.rb
rm config/temp.rb
