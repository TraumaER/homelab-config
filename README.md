# Homelab Config

[![Build Status](https://github.com/yourusername/homelab-config/actions/workflows/ci.yml/badge.svg)](https://github.com/yourusername/homelab-config/actions)
[![License](https://img.shields.io/github/license/yourusername/homelab-config)](LICENSE)

This repository contains Infrastructure as Code (IaC) configurations for managing a homelab environment. The
configurations are designed to be generic and reusable across different setups, making it easy to deploy and maintain
your own homelab infrastructure.

## Features

- DNS management with CoreDNS and Unbound
- Reverse proxy with Caddy
- Cloudflare DNS integration
- Docker-based deployment

## Prerequisites

- Docker and Docker Compose
- Domain name (for Cloudflare integration)
- Cloudflare API token
- Basic understanding of networking concepts

## Setup

1. Clone this repository
2. Copy `.env.example` to `.env` and fill in your configuration
3. Customize domain names and network settings as needed
4. Run `docker-compose up -d` in the desired service directory

## Usage

Each service is organized in its own directory with associated configuration files. Refer to individual service
directories for specific setup instructions and customization options.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
