#!/bin/bash

# Source and target directories
source_dir="/path/to/source"
target_dir="/path/to/backup"

# Timestamp for backup folder
timestamp=$(date +"%Y%m%d%H%M%S")
backup_folder="$target_dir/backup_$timestamp"

# Create backup folder
mkdir -p "$backup_folder"

# Copy files from source to backup folder
cp -r "$source_dir" "$backup_folder"

# Verify the copy process
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
fi

# Compress the backup folder
backup_archive="$target_dir/backup_$timestamp.tar.gz"
tar -czf "$backup_archive" -C "$target_dir" "backup_$timestamp"

# Clean up temporary backup folder
rm -r "$backup_folder"

# Display backup archive information
echo "Backup archive: $backup_archive"
echo "Backup size: $(du -sh "$backup_archive" | cut -f1)"

# Optional: Clean up old backups (e.g., keep the last 7 days)
find "$target_dir" -maxdepth 1 -name "backup_*" -type d -ctime +7 -exec rm -r {} \;
