# bind-key C-a last-window
#setw -g mode-mouse on
#set -g mouse-select-pane on
#set -g mouse-resize-pane on
#set -g mouse-select-window on
#setw -g alternate-screen on

#setw -g mode-keys vi
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection

# Reload key
bind r source-file ~/.tmux.conf

# screen ^C c
unbind ^W
bind ^W new-window
unbind w
bind w new-window

bind  Left previous-window
bind  Right next-window

unbind % # Remove default binding since re replacing
bind '\' split-window -h
bind '-' split-window -v
bind '[' select-pane -L
bind ']' select-pane -R


set -g status-bg black
set -g status-fg white
set -g status-left '#[fg=green]#H'
#set-window-option -g window-status-current-bg red
setw window-status-format ' #I#[fg=color250]:#[fg=color255]#W#[fg=color50]#F '
set -g status-right '#[fg=yellow]#(uptime | cut -d "," -f 2-)'

# balanced rows ctrl-b,  alt-2
# balanced column ctrl-b,  alt-1
