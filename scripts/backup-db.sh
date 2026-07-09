#!/usr/bin/env sh
set -eu

BACKUP_DIR="${BACKUP_DIR:-backups}"
DB_NAME="${MYSQL_DATABASE:-otobo}"
DB_USER="${MYSQL_USER:-otobo}"
DB_PASSWORD="${MYSQL_PASSWORD:-change-me-otobo}"
STAMP=$(date +"%Y%m%d-%H%M%S")
OUT_FILE="$BACKUP_DIR/${DB_NAME}-${STAMP}.sql.gz"

mkdir -p "$BACKUP_DIR"

echo "Creating database backup: $OUT_FILE"
docker compose exec -T db sh -c "mariadb-dump -u'$DB_USER' -p'$DB_PASSWORD' '$DB_NAME'" | gzip > "$OUT_FILE"

echo "Backup complete: $OUT_FILE"
