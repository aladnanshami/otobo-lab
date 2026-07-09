# Security Notes

This is a local lab setup. These are the checks I would review before using a similar setup outside a laptop.

## Secrets

- Keep real passwords in `.env`.
- Do not commit `.env`.
- Rotate the sample passwords before using the stack anywhere shared.

## Network

- Only the OTOBO web port is published to the host.
- The database stays on the internal Docker network.
- Use a reverse proxy with HTTPS before exposing OTOBO outside localhost.

## Backups

- Store backups outside the Docker host for anything important.
- Test restore steps, not only backup creation.
- Keep more than one backup generation.

## Updates

- Pin image versions before long-term use.
- Test updates in a separate copy of the lab first.
- Read OTOBO release notes before upgrading.
