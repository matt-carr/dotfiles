#!/bin/sh
PWD=$(pwd)
(exec $PWD/install_tools.sh)
(exec $PWD/install_fish.sh)
(exec $PWD/install_bash.sh)
(exec $PWD/install_vim.sh)
