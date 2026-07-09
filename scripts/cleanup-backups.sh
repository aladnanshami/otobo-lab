#!/usr/bin/env sh
set -eu

BACKUP_DIR="${BACKUP_DIR:-backups}"
KEEP_DAYS="${KEEP_DAYS:-14}"

if [ ! -d "$BACKUP_DIR" ]; then
  echo "No backup directory found: $BACKUP_DIR"
  exit 0
fi

echo "Removing database backups older than $KEEP_DAYS days from $BACKUP_DIR"
find "$BACKUP_DIR" -type f -name "*.sql.gz" -mtime +"$KEEP_DAYS" -print -delete

echo "Backup cleanup complete."
