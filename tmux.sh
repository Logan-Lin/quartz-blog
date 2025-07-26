#!/bin/bash

SESSION_NAME="blog"

if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    tmux attach-session -t $SESSION_NAME
    exit 0
fi

tmux new-session -d -s $SESSION_NAME -c "/Users/yanlin/Documents/Projects/personal-blog"
tmux rename-window -t $SESSION_NAME:1 "nvim"
tmux send-keys -t $SESSION_NAME:1 "nvim" C-m
tmux new-window -t $SESSION_NAME:2 -n "ai"
tmux send-keys -t $SESSION_NAME:2 "claude -r" C-m
tmux new-window -t $SESSION_NAME:3 -n "bash"

tmux select-window -t $SESSION_NAME:1

tmux attach-session -t $SESSION_NAME
