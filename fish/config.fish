# User customizations for fish shell
# Add your custom fish config below. The default fish setup is auto-loaded.

# Disable welcome message
set -g fish_greeting

# Starship prompt initialization
starship init fish | source

# vfox version manager activation
vfox activate fish | source
