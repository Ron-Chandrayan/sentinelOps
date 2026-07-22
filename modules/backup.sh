#!/usr/bin/env bash

create_backup() {

    SOURCE_DIR="$1"

    if [[ $SOURCE_DIR ]]; then
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
    else
	    echo "Please provide the source directory"
	    log_warning "Please provide source directory"
    fi
}

list_backups() {

    echo "=============== Available Backups ==============="

    if compgen -G "$BACKUP_DIR/*.zip" > /dev/null; then
        ls -lh "$BACKUP_DIR"/*.zip
    else
        log_warning "No backups found."
    fi
}

restore_backup() {
	ZIP_NAME="$1"
	echo "$DEST_DIR"
	if [[ $ZIP_NAME ]]; then
		if [[ -f "$BACKUP_DIR/$ZIP_NAME.zip" ]]; then
    			echo "Your backup file exists."
			# unzip "$BACKUP_DIR/$ZIP_NAME.zip" -d "$DEST_DIR"
			echo "Backup restored"
		else
			log_error "Your backup file doesn't exist. Make sure to use filename inside apostrophe"
    			echo "Your backup file doesn't exist. Make sure to use filename inside apostrophe "
    			return 1
		fi
	else
		log_warning "Please provide the filename"
		echo "Please provide the filename"
	fi
}

delete_backup() {
	echo "delete"
}
