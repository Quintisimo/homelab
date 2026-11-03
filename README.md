# Homelab Documentation

## Setup

### Setting up Doco-cd

- Create docker volume for doco-cd by running `docker volume create doco-cd`.

- Create a `docker-compose.yml` with contents:

```yaml
name: doco-cd

services:
  doco-cd:
    container_name: doco-cd
    environment:
      GIT_ACCESS_TOKEN: your_github_access_token_here with fine grained permission read contents and write commit statuses
      GIT_AUTH_DOMAINS: |
        - domains: 
          - github.com
      GIT_COMMIT_STATUS: true
      POLL_CONFIG: |
        - url: https://github.com/quintisimo/homelab
          reference: main
      SOPS_AGE_KEY: your_age_key_here
    healthcheck:
      interval: 30s
      retries: 3
      start_period: 15s
      test:
        - CMD
        - healthcheck
      timeout: 5s
    image: ghcr.io/kimdre/doco-cd:latest
    restart: unless-stopped
    volumes:
      - doco-cd:/data
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro

volumes:
  doco-cd:
    external: true
    name: doco-cd
```

- Run `docker compose up -d` to start the Doco-cd service.

### Updating doco-cd

- Run `docker compose pull` to pull the latest image.

- Run `docker compose up -d` to restart the service with the new image.

- Run `docker system prune` to clean up unused images, containers, and networks.

### Editing secrets

- Set env variable `SOPS_AGE_KEY` to your Age private key.

- Use `sops edit <file>` to edit encrypted files.
