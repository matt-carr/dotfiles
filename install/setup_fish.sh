# install fish
echo "Adding fish PPA and installing fish"
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt-get update -y
sudo apt-get install fish -y

confDir=$(fish -c 'echo $__fish_config_dir')

sudo chsh -s /usr/bin/fish

# update fish config
echo "Updating Fish Config"
cp ../fish/config.fish $confDir/config.fish
cp -r ../fish/functions $confDir/functions

# setup pyenv
fish -c "set -Ux PYENV_ROOT $HOME/.pyenv"
fish -c "fish_add_path $PYENV_ROOT/bin"

# install fisher
echo "Installing fisher and plugins"
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# install plugins
cp ../fish/fish_plugins $confDir/fish_plugins
fish -c "fisher update"

# configure tide shell
fish -c "tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time='24-hour format' --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline-prompt-tails=Flat --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=Yes --prompt_connection_andor_frame_color=Dark --prompt_spacing=Sparse --icons='Many icons' --transient=No" 

# setup git
echo "Setting up git"
cp ../gitconfig ~/.gitconfig

echo "========Fish Setup Complete!========"
