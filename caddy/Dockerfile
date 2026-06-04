FROM caddy:builder@sha256:47a19b0d310d09e226e9d7b9bcfb4bcc8fa7480d8903e2ebd40fa1512b9ce38c AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:a22e108570bde2bf9ca3e584bc7d5bb94f9555e9e17353242e6ec4505ff4880d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
