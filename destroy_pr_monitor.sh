#!/bin/bash
# Takes one parameter which is the team name

name=`echo "print '$1'.downcase" | ruby`

## Destroy scaffolds for Users, PullRequests and Repos
 rails destroy scaffold $1'User'
 rails destroy scaffold $1'PullRequest'
 rails destroy scaffold $1'Repo'

 ## Controllers
 rm -rf app/controllers/${name}_controller.rb

 ## Views
 rm -rf app/views/${name}

 ## Rake
rm -rf lib/tasks/${name}_monitor.rake

## shell scripts
rm run_scripts/run_${name}_user.sh
rm run_scripts/run_${name}_pr.sh
rm run_scripts/run_${name}_email.sh