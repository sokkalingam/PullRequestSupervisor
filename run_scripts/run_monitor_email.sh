#!/bin/bash

cd /home/deploy/PullRequestSupervisor
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rake monitor:email > monitor_email.log
