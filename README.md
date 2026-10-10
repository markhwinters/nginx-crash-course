# NGINX Crash Course

This project demonstrates how to use NGINX as a reverse proxy in front of multiple Node.js/Express services. It is a simple load-balancing and TLS example built with Docker Compose.

## What this project does

- Runs an NGINX container on ports 80 and 443
- Redirects HTTP traffic to HTTPS
- Uses a self-signed certificate for local HTTPS
- Load-balances requests across three Express apps:
  - App1
  - App2
  - App3
- Serves a static landing page from each app instance

## Project structure

- `docker-compose.yml` — starts the NGINX proxy and all app containers
- `Dockerfile` — builds each backend app container
- `config/nginx.conf` — NGINX reverse proxy and HTTPS configuration
- `src/server.js` — Express app entry point
- `src/index.html` — homepage served by the app containers
- `src/images/` — static image assets
- `certs/` — generated locally for HTTPS; TLS files are not committed

## Tech stack

- Node.js
- Express
- NGINX
- Docker
- Docker Compose

## Generate a local TLS certificate

Create the certificate files locally before starting the stack:

```bash
mkdir -p certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout certs/nginx-selfsigned.key \
  -out certs/nginx-selfsigned.crt
```

These files are meant for local development and should not be included in a public gist or committed to source control.

## Start the project

From the project root, run:

```bash
docker compose up --build -d
```

This will build the app images if needed and start all services in the background.

After startup, open:

- http://localhost
- https://localhost

> The HTTP listener redirects to HTTPS. Since the certificate is self-signed, your browser may warn you before allowing access.

## Stop the project

To stop and remove the containers:

```bash
docker compose down
```

If you also want to remove orphaned containers and networks:

```bash
docker compose down --remove-orphans
```

## Useful commands

View active container status:

```bash
docker compose ps
```

View logs:

```bash
docker compose logs -f
```

Restart the stack:

```bash
docker compose restart
```

## Notes

This is a local development/demo setup, so it uses a self-signed certificate and is intended for learning and testing NGINX reverse proxy patterns rather than production deployment.
