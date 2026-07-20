#!/usr/bin/env bash


source "$(dirname "${BASH_SOURCE[0]}")/lib/helpers.sh"
source "$(dirname "${BASH_SOURCE[0]}")/lib/logger.sh"

command_exists git
command_exists docker
command_exists python
