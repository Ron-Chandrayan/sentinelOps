#!/bin/bash

set -euo pipefail

VERSION="1.0.0"

COMMAND="${1:-help}"

#${variable:-default_value}

source lib/colors.sh
source lib/logger.sh
source lib/helpers.sh
source lib/validator.sh

case "$COMMAND" in

dashboard)
	echo "Dashboard mode selected"
	;;

monitor)
	echo "Monitor mode selected"
	;;

backup)
	echo "Backup module selected"
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

