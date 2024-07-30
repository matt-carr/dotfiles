#!/bin/bash

echo "Adding fish PPA and installing fish"
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

confDir=$(fish -c 'echo $__fish_config_dir')

echo "Copying config and fish functions"
cp config.fish $confDir/config.fish
cp -r fish_functions $confDir/functions

echo "Downloading and installing fisher"
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

echo "Installing plugins"
cp fish_plugins $confDir/fish_plugins.fish
fish -c "fisher update"

echo "Configuring prompt"
fish -c "tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time='24-hour format' --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_pr
ompt_tails=Flat --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=Yes --prompt_connection_andor_frame_color=Dark --prompt_spacing=Sparse --icons
='Many icons' --transient=No"
