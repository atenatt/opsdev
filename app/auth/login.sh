#!/bin/bash

# Load environment variables
DB_HOST=${DB_HOST:-localhost}
DB_USER=${DB_USER:-postgres}
DB_NAME=${DB_NAME:-postgres}

function login() {
    # Prompt for username
    username=$(whiptail --inputbox "Enter your username:" 10 60 --title "Login" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        echo "Login cancelled."
        exit 1  # Finaliza o script ao cancelar
    fi

    # Prompt for password
    password=$(whiptail --passwordbox "Enter your password:" 10 60 --title "Login" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        echo "Login cancelled."
        exit 1  # Finaliza o script ao cancelar
    fi

    # Fetch user record from database
    user_record=$(psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -t -c \
        "SELECT username, password_hash, role FROM users WHERE username='$username';")

    if [ -z "$user_record" ]; then
        whiptail --msgbox "Invalid username or password." 10 60 --title "Login Failed"
        return 1
    fi

    # Extract stored hash and role from the user record
    stored_hash=$(echo "$user_record" | awk '{print $2}')
    salt=$(echo "$stored_hash" | awk -F'$' '{print $3}')
    entered_hash=$(mkpasswd -m sha-256 "$password" "\$5\$$salt")

    # Compare the hashes
    if [ "$entered_hash" != "$stored_hash" ]; then
        whiptail --msgbox "Invalid username or password." 10 60 --title "Login Failed"
        return 1
    fi

    role=$(echo "$user_record" | awk '{print $3}')
    export CURRENT_USER=$username
    export CURRENT_ROLE=$role
    whiptail --msgbox "Welcome, $username! You are logged in as $role." 10 60 --title "Login Successful"
    return 0  # Login bem-sucedido
}

login
