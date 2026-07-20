#!/usr/bin/env bash



command_exists() {
    if command -v "$1" >/dev/null 2>&1; then
        log_success "$1 command exists"
    else
        log_error "$1 command does not exist"
    fi
}
