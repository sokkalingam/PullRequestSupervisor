#!/bin/bash

cd /home/deploy/PullRequestSupervisor
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rake smb:pr > smb_pr.log
