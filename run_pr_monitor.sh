#!/bin/bash

cd /home/deploy/PullRequestSupervisor
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rake pr:monitor > pr_monitor.log
