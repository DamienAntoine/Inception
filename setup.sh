#!/bin/bash

# copy environment template
if [ ! -f "srcs/.env" ]; then
    echo "Creating .env from template"
    cp srcs/.env.template srcs/.env
    echo "Edit srcs/.env with your configuration"
else
    echo ".env already exists"
fi

# create data directories
echo "Creating data directories..."
mkdir -p srcs/data/wordpress
mkdir -p srcs/data/mariadb

# create gitkeep files
touch srcs/data/.gitkeep
touch secrets/.gitkeep

# generate ssl
if [ ! -f "secrets/cert.crt" ] || [ ! -f "secrets/cert.key" ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout secrets/cert.key \
        -out secrets/cert.crt \
        -subj "/C=LU/ST=Luxembourg/L=Luxembourg/O=42School/CN=localhost"
fi

echo ""
echo "1. Edit srcs/.env with your configuration"
echo "2. Run 'make' to start the project"
echo ""
