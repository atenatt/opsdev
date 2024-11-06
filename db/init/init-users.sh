#!/bin/bash

# Generate a secure password hash using OpenSSL with SHA256-CRYPT
hashed_password=$(echo -n "$POSTGRES_PASSWORD" | openssl passwd -5 -stdin)

# Insert the admin user into the database with the hashed password
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
    INSERT INTO users (username, password_hash, role)
    VALUES 
    ('admin', '$hashed_password', 'admin');
EOSQL