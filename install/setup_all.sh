#!/bin/sh
PWD=$(pwd)
(exec $PWD/setup_tools.sh)
(exec $PWD/setup_fish.sh)
(exec $PWD/setup_bash.sh)
(exec $PWD/setup_vim.sh)
