#!/bin/bash

cd /home/deploy/PullRequestSupervisor
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rake places:user > logs/places_user.log
