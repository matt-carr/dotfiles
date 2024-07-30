# install fish
echo "Adding fish PPA and installing fish"
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

confDir=$(fish -c 'echo $__fish_config_dir')

sudo chsh -s /usr/bin/fish

# update fish config
echo "Updating Fish Config"
cp config.fish $confDir/config.fish
cp -r fish_functions $confDir/functions

# install fisher
echo "Installing fisher and plugins"
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# install plugins
cp fish_plugins $confDir/fish_plugins.fish
fish -c "fisher update"

# configure tide shell
fish -c "tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time='24-hour format' --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline-prompt-tails=Flat --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=Yes --prompt_connection_andor_frame_color=Dark --prompt_spacing=Sparse --icons='Many icons' --transient=No" 

# setup git
echo "Setting up git"
cp ../gitconfig ~/.gitconfig

# setup pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
