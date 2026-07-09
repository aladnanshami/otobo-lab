# Maintenance

Simple routine checks for the local lab.

## Daily

```bash
make status
make health
```

## Before Changes

```bash
make backup
```

Write down the backup file name before making changes.

## After Changes

```bash
make health
make backup
```

Check the logs if the health check fails:

```bash
docker compose logs --tail=100 otobo
docker compose logs --tail=100 db
```

## Backup Cleanup

By default this removes database backups older than 14 days:

```bash
make prune
```

To use a different retention window:

```bash
KEEP_DAYS=30 make prune
```
