#!/usr/bin/env bash


log_success() {
	log="[SUCCESS] $(date "+%Y-%m-%d %H:%M:%S") ${1:-No message provided}"
	echo "${log}"
	echo "${log}" >> "/home/chandrayan_paul/sentinelOps/logs/sentinel.log"
}

log_warning() {
	log="[WARNING] $(date "+%Y-%m-%d %H:%M:%S") ${1:-No message provided}"
	echo "${log}"
	echo "${log}" >> "/home/chandrayan_paul/sentinelOps/logs/sentinel.log"
}

log_error() {
	log="[ERROR] $(date "+%Y-%m-%d %H:%M:%S") ${1:-No message provided}"
	echo "${log}"
	echo "${log}" >> "/home/chandrayan_paul/sentinelOps/logs/sentinel.log"
}

log_info() {
    	log="[INFO] $(date "+%Y-%m-%d %H:%M:%S") ${1:-No message provided}"
	echo "${log}"
	echo "${log}" >> "/home/chandrayan_paul/sentinelOps/logs/sentinel.log"
}
