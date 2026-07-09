#!/usr/bin/env sh
set -eu

PORT="${OTOBO_HTTP_PORT:-8080}"
URL="${OTOBO_URL:-http://localhost:${PORT}/otobo/}"

echo "Checking OTOBO at $URL"

if curl -fsS "$URL" >/dev/null; then
  echo "OTOBO is reachable."
  exit 0
fi

echo "OTOBO is not reachable yet." >&2
echo "Try: docker compose ps" >&2
echo "Try: docker compose logs --tail=100 otobo" >&2
exit 1
