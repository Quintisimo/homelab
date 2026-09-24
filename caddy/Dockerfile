FROM caddy:builder@sha256:401121e61853cb9c7df83cba43e532e49a68e30f32921c7bdcb7a4912168c067 AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:13ba145cba2f3e28fa801994876e4c086d1b95d5aa2a520a734765ffb6b12017

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
