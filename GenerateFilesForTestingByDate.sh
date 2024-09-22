#!/bin/bash
#Quick rough script to create files with a range of dates to use for testing an archiving script
#Possible improvements include randomisation of dates and differing timestampt on the files

# Directories for testing
TARGET_DIR="./target"
BACKUP_DIR="./target/bak"

# Ensure directories exist
mkdir -p "$TARGET_DIR"
mkdir -p "$BACKUP_DIR"

# Function to create a file with a specific modification time
create_file_with_mtime() {
  local dir="$1"
  local filename="$2"
  local days_ago="$3"

  # Create an empty file
  touch "$dir/$filename"

  # Set the file's modification time to 'days_ago' days from today
  touch -d "$days_ago days ago" "$dir/$filename"
}

# Create files in TARGET_DIR with modification times from 1 to 90 days ago
for i in {1..90}; do
  create_file_with_mtime "$TARGET_DIR" "file_$i.txt" "$i"
done

echo "Created 90 files in $TARGET_DIR with modification times ranging from 1 to 90 days ago."

# Create files in BACKUP_DIR that are more than 60 days old (for cleanup testing)
for i in {51..70}; do
  create_file_with_mtime "$BACKUP_DIR" "backup_file_$i.txt" "$i"
done

echo "Created files in $BACKUP_DIR with modification times older than 60 days."

