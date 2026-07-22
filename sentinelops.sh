#!/bin/bash

set -euo pipefail

VERSION="1.0.0"

COMMAND="${1:-help}"

#${variable:-default_value}

source lib/colors.sh
source lib/logger.sh
source lib/helpers.sh
source lib/validator.sh

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$PROJECT_ROOT/backups"
LOG_DIR="$PROJECT_ROOT/logs"


case "$COMMAND" in

dashboard)
	source modules/dashboard.sh
	show_dashboard
	;;

monitor)
	source modules/monitor.sh
	show_monitor
	;;

backup)
	source modules/backup.sh
	case $2 in
		create)
			create_backup "$3"
			;;
		list)
			list_backups
			;;
		restore)
			restore_backup "$3"
			;;
		delete)
			delete_backup "$3"
			;;
		*)
		echo "Usage:"
            	echo "./sentinelops.sh backup create <directory>"
            	echo "./sentinelops.sh backup list"
            	echo "./sentinelops.sh backup restore <backup>"
            	echo "./sentinelops.sh backup delete <backup>"
		;;
	esac
	;;

docker)
	echo "Docker module selected"
	;;

deploy)
	echo "Deployment module selected"
	;;

users)
	echo "Users module selected"
	;;

services)
	echo "Services module selected"
	;;

logs)
	echo "Logs module selected"
	;;

network)
	echo "Network module selected"
	;;

security)
	echo "Security module selected"
	;;

aws)
	echo "AWS module selected"
	;;

cron)
	echo "Cron module selected"
	;;

version)
	echo "$VERSION"
	;;

help)
	echo "Help page coming soon"
	;;

*)
	echo "Unknown Command selected"
	echo "Run './sentinelops.sh help'"
	exit 1
	;;

esac

