# Troubleshooting

## OTOBO Is Not Reachable

Check containers:

```bash
docker compose ps
```

Check logs:

```bash
docker compose logs --tail=100 otobo
docker compose logs --tail=100 db
```

## Database Is Not Ready

The OTOBO container waits for the database health check. If startup is slow, watch the database logs:

```bash
docker compose logs -f db
```

## Port 8080 Is Already In Use

Edit `.env`:

```text
OTOBO_HTTP_PORT=8081
```

Then restart:

```bash
make down
make up
```

## Fresh Start

If this is only a lab and you can delete all local data:

```bash
make clean
make up
```
