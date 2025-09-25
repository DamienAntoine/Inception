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

echo ""
echo "1. Edit srcs/.env with your configuration"
echo "2. Run 'make' to start the project"
echo ""
