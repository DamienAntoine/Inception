# Inception - Docker WordPress Environment

This project creates a complete WordPress environment using Docker with Nginx, WordPress, and MariaDB.

## Quick Start

```bash
# 1. Run setup script to create necessary files
./setup.sh

# 2. Edit configuration (REQUIRED)
nano srcs/.env

# 3. Build and start containers
make

```

## Requirements

- Docker and Docker Compose
- Make
- OpenSSL (for certificate generation)

## Configuration

After running `./setup.sh`, edit `srcs/.env` with your values:

- **DOMAIN_NAME**: Your domain
- **WP_ADMIN**: WordPress admin username
- **WP_ADMIN_PASSWORD**: WordPress admin password
- **MYSQL_PASSWORD**: Database password
- etc...

## Commands

```bash
make        # Build and start all containers
make down   # Stop all containers
make clean  # Remove containers and images
make fclean # Complete cleanup including volumes
make re     # Rebuild everything
```

## Project Structure

```
srcs/
├── docker-compose.yml
├── .env (created by setup.sh)
├── requirements/
│   ├── nginx/
│   ├── wordpress/
│   └── mariadb/
└── data/
    ├── wordpress/
    └── mariadb/
```
