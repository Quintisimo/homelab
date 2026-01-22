# Homelab Documentation

## Setup

### Setting up Doco-cd

- Create a `docker-compose.yml` with contents:

```yaml
name: doco-cd

services:
  doco-cd:
    container_name: doco-cd
    environment:
      SOPS_AGE_KEY: your_age_key_here
      POLL_CONFIG: |
        - url: https://github.com/quintisimo/homelab
          interval: 604800 # once a week
    healthcheck:
      interval: 30s
      retries: 3
      start_period: 15s
      test:
        - CMD
        - /doco-cd
        - healthcheck
      timeout: 5s
    image: ghcr.io/kimdre/doco-cd:latest
    restart: unless-stopped
    volumes:
      - doco-cd:/etc/doco-cd
      - /etc/localtime:/etc/localtime:ro

volumes:
  doco-cd:
    external: true
    name: doco-cd
```

- Run `docker compose up -d` to start the Doco-cd service.

### Editing secrets

- Set env variable `SOPS_AGE_KEY` to your Age private key.
- Use `sops edit <file>` to edit encrypted files.
