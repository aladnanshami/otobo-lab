# OTOBO Lab

A local OTOBO helpdesk lab for practicing installation, daily operations, backup, restore, and health checks with Docker Compose.

I use this as a simple place to test OTOBO setup steps and keep the commands I need in one repo.

## What Is Included

- OTOBO application container
- MariaDB database container
- Persistent volumes for app data and database data
- Make targets for common operations
- Health check script
- Database backup and restore scripts
- Backup cleanup script
- Architecture, security, and maintenance notes
- GitHub Actions validation for Compose and shell scripts

## Requirements

- Docker Desktop or Docker Engine
- Docker Compose v2
- `make`
- `curl`

## Quick Start

```bash
cp .env.example .env
make up
make status
```

Open OTOBO:

```text
http://localhost:8080/otobo/installer.pl
```

Follow the installer and use the database settings from `.env`.

## Common Commands

```bash
make up          # Start the lab
make down        # Stop containers
make logs        # Follow logs
make status      # Show container status
make health      # Check HTTP endpoint
make backup      # Create database backup in backups/
make restore     # Restore BACKUP=backups/file.sql.gz
make prune       # Remove old backups, default older than 14 days
make clean       # Stop and remove volumes
```

## Default Local Settings

| Setting | Value |
|---|---|
| OTOBO URL | `http://localhost:8080/otobo/` |
| Installer URL | `http://localhost:8080/otobo/installer.pl` |
| Database host | `db` |
| Database name | `otobo` |
| Database user | `otobo` |

Passwords live in `.env`, which is ignored by git.

## Project Structure

```text
.
├── docker-compose.yml
├── .env.example
├── Makefile
├── scripts/
│   ├── backup-db.sh
│   ├── cleanup-backups.sh
│   ├── healthcheck.sh
│   └── restore-db.sh
└── docs/
    ├── architecture.md
    ├── maintenance.md
    ├── operations.md
    ├── security.md
    └── troubleshooting.md
```

## Notes

This setup is for local practice. Before using OTOBO in production, review the official OTOBO documentation, harden secrets, configure TLS, store backups outside the Docker host, and use a production-grade mail setup.
