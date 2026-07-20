#!/usr/bin/env bash

source lib/logger.sh

log_info "Starting SentinelOps..."
log_success "Backup completed successfully."
log_warning "Disk usage is above 80%."
log_error "Docker is not running."
