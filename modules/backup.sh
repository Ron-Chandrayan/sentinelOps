#!/usr/bin/env bash

create_backup() {

    SOURCE_DIR="$1"

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    DIR_NAME=$(basename "$SOURCE_DIR")
    BACKUP_FILE="${DIR_NAME}_${TIMESTAMP}.zip"

    if zip -rq "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"; then

        log_success "Backup created successfully."
        echo "Location : $BACKUP_DIR/$BACKUP_FILE"
        echo "Size     : $(du -sh "$BACKUP_DIR/$BACKUP_FILE" | cut -f1)"

    else

        log_error "Backup generation failed."
        return 1

    fi
}

list_backups() {
	echo "list backups"
}

restore_backup() {
	echo "restore"
}

delete_backup() {
	echo "delete"
}
