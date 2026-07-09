# Operations

This page describes the normal operating flow for the local OTOBO lab.

## Start

```bash
cp .env.example .env
make up
```

## Check Status

```bash
make status
make health
```

## View Logs

```bash
make logs
```

For a single service:

```bash
docker compose logs -f otobo
docker compose logs -f db
```

## Backup

```bash
make backup
```

Backups are stored in `backups/` and ignored by git.

## Restore

```bash
BACKUP=backups/otobo-YYYYMMDD-HHMMSS.sql.gz make restore
```

## Reset Lab

This removes containers and volumes.

```bash
make clean
```
