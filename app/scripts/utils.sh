#!/bin/bash

# Ensure .pgpass is created with proper credentials for PostgreSQL
function setup_pgpass() {
    if [ -z "$DB_HOST" ] || [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ]; then
        echo "Error: Database environment variables are not properly set."
        exit 1
    fi

    echo "$DB_HOST:5432:$DB_NAME:$DB_USER:$DB_PASSWORD" > /root/.pgpass
    chmod 600 /root/.pgpass
    echo ".pgpass file created successfully."
}
