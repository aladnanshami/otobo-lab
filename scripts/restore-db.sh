#!/usr/bin/env sh
set -eu

if [ -z "${BACKUP:-}" ]; then
  echo "Usage: BACKUP=backups/otobo-YYYYMMDD-HHMMSS.sql.gz make restore" >&2
  exit 1
fi

if [ ! -f "$BACKUP" ]; then
  echo "Backup file not found: $BACKUP" >&2
  exit 1
fi

DB_NAME="${MYSQL_DATABASE:-otobo}"
DB_USER="${MYSQL_USER:-otobo}"
DB_PASSWORD="${MYSQL_PASSWORD:-change-me-otobo}"

echo "Restoring $BACKUP into database $DB_NAME"
gzip -dc "$BACKUP" | docker compose exec -T db sh -c "mariadb -u'$DB_USER' -p'$DB_PASSWORD' '$DB_NAME'"

echo "Restore complete."
