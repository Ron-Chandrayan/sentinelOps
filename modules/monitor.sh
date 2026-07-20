#!/usr/bin/env bash

show_cpu_info() {

    CPU_CORES=$(nproc)
    LOAD_AVERAGE=$(uptime | awk -F'load average:' '{print $2}')
    CPU_MODEL=$(lscpu | grep "Model name" | sed 's/Model name:[[:space:]]*//')

    echo "==================== CPU ===================="

    printf "%-20s : %s\n" "CPU Model" "$CPU_MODEL"
    printf "%-20s : %s\n" "CPU Cores" "$CPU_CORES"
    printf "%-20s : %s\n" "Load Average" "$LOAD_AVERAGE"

    echo
}

show_memory_info() {

    echo "=================== Memory =================="

    free -h

    echo
}

show_disk_info() {

    echo "==================== Disk ==================="

    df -h --output=source,size,used,avail,pcent,target /

    echo
}

show_network_info() {

    echo "=================== Network ================="

    LOCAL_IP=$(hostname -I | awk '{print $1}')

    printf "%-20s : %s\n" "Local IP" "$LOCAL_IP"

    if ping -c 1 8.8.8.8 >/dev/null 2>&1; then
        log_success "Internet Connection Available"
    else
        log_error "No Internet Connection"
    fi

    echo
}

show_docker_info() {

    echo "=================== Docker =================="

    if command_exists docker; then

        if docker info >/dev/null 2>&1; then
            log_success "Docker daemon is running."
        else
            log_warning "Docker installed but daemon not running."
        fi

    else
        log_error "Docker is not installed."
    fi

    echo
}

show_monitor() {

    log_info "Loading System Monitor..."

    echo "===================================================="
    echo "             SentinelOps System Monitor"
    echo "===================================================="

    show_cpu_info
    show_memory_info
    show_disk_info
    show_network_info
    show_docker_info

}

