# DNS Stack

This directory contains a complete DNS stack for your homelab, providing both internal and external DNS resolution with ad/malware blocking capabilities.

## Overview

The DNS stack consists of the following components:

1. **CoreDNS**: A flexible, plugin-based DNS server that:
   - Blocks ads and malware using a hosts file
   - Handles internal domain name resolution
   - Forwards external DNS queries to Unbound

2. **Unbound**: A validating, recursive DNS resolver that:
   - Provides secure and private DNS resolution
   - Implements various security hardening measures
   - Caches DNS responses for better performance

3. **Caddy**: A web server that:
   - Provides TLS termination using Cloudflare DNS validation
   - Acts as a reverse proxy for internal services
   - Automatically manages SSL certificates

4. **Hello**: A simple HTTP echo server for testing the setup

## Prerequisites

- Docker and Docker Compose
- Cloudflare account with a domain
- Cloudflare API token with Zone:Zone:Read and Zone:DNS:Edit permissions
- Ripgrep (`sudo apt install ripgrep`) for blocklist updates

## Setup Instructions

1. **Create Environment File**:
   Copy the `.env.template` file to `.env` and fill in the required values:
   ```
   # Cloudflare API token with Zone:Zone:Read and Zone:DNS:Edit permissions
   CLOUDFLARE_API_TOKEN=your-cloudflare-api-token
   
   # Domain to be used for your internal services
   INTERNAL_DOMAIN=your-domain.com
   ```

2. **Configure Internal Domain**:
   Copy the `coredns/internal.domain.db.example` file to `coredns/internal.domain.db` and update:
   - Replace `<admin account email>` with your email address
   - Replace `<IP Address you want your subdomains redirected to>` with the IP address of your server

3. **Update Caddyfile**:
   Edit the `Caddyfile` to replace `bannach.xyz` with your domain name.

4. **Update Blocklist** (Optional):
   Run the blocklist updater script to get the latest ad/malware domain list:
   ```
   cd coredns
   ./blocklist-updater.sh
   ```

## Running the Stack

Start the DNS stack with:

```
docker-compose up -d
```

To check the status:

```
docker-compose ps
```

To view logs:

```
docker-compose logs
```

To stop the stack:

```
docker-compose down
```

## Using the DNS Server

Configure your devices or router to use the server's IP address as the DNS server (port 54).

## Component Details

### CoreDNS Configuration

The `Corefile` configures CoreDNS to:
- Block ads and malware using the hosts.blocklist file
- Resolve internal domain names using the internal.domain.db file
- Forward all other requests to Unbound

### Unbound Configuration

The `unbound/custom.conf.d/coredns.conf` file configures Unbound with:
- Security hardening options
- Performance optimizations
- Private address handling

### Caddy Configuration

The `Caddyfile` configures Caddy to:
- Obtain and manage SSL certificates for your domain using Cloudflare DNS validation
- Set up a reverse proxy for the hello service (example)

## Troubleshooting

- If DNS resolution isn't working, check that the containers are running with `docker-compose ps`
- Verify that your device is configured to use the correct DNS server address
- Check the logs with `docker-compose logs` for any error messages