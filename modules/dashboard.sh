#!/usr/bin/env bash

show_dashboard() {

    SYSTEM_HOSTNAME=$(hostname)
    CURRENT_USER=$(whoami)
    SYSTEM_OVERVIEW=$(uname -a)
    OPERATING_SYSTEM=$(uname -o)
    KERNEL_NAME=$(uname -s)
    KERNEL_VERSION=$(uname -r)
    UPTIME=$(uptime -p)
    BOOT_TIME=$(uptime -s)
    CURRENT_DATE=$(date)

    DISK_USAGE=$(df -h --output=source,size,used,avail,pcent,target /)

    RAM_USAGE=$(free -h)

    log_info "Loading SentinelOps Dashboard..."

    echo "===================================================="
    echo "              SentinelOps Dashboard"
    echo "===================================================="

    printf "%-20s : %s\n" "Hostname" "$SYSTEM_HOSTNAME"
    printf "%-20s : %s\n" "Current User" "$CURRENT_USER"
    printf "%-20s : %s\n" "Operating System" "$OPERATING_SYSTEM"
    printf "%-20s : %s\n" "Kernel Name" "$KERNEL_NAME"
    printf "%-20s : %s\n" "Kernel Version" "$KERNEL_VERSION"
    printf "%-20s : %s\n" "System Uptime" "$UPTIME"
    printf "%-20s : %s\n" "Boot Time" "$BOOT_TIME"
    printf "%-20s : %s\n" "Current Date" "$CURRENT_DATE"

    echo
    echo "==================== Disk Usage ===================="

    echo "$DISK_USAGE"

    echo
    echo "==================== RAM Usage ====================="

    echo "$RAM_USAGE"

    echo
    echo "=================== Docker Status =================="

    if command_exists docker >/dev/null 2>&1; then

        if docker info >/dev/null 2>&1; then
            log_success "Docker is installed and running."
        else
            log_warning "Docker is installed but daemon is not running."
        fi

    else
        log_error "Docker is not installed."
    fi

    echo
    echo "===================================================="

}
