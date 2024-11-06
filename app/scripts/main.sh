#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Source utility functions and menu configurations
source "$SCRIPT_DIR/utils.sh"
source "$SCRIPT_DIR/../config/whiptail_menus.sh"

# Ensure PostgreSQL authentication is set up
setup_pgpass

# Function to handle user login
function require_login() {
    while true; do
        "$SCRIPT_DIR/../auth/login.sh"  # Caminho relativo dinâmico
        if [ $? -eq 0 ]; then
            return 0  # Login bem-sucedido
        else
            whiptail --msgbox "Login failed. Please try again." 10 60 --title "Login Error"
        fi
    done
}

# Main menu loop
function main_menu() {
    while true; do
        CHOICE=$(display_main_menu)

        case $CHOICE in
            1) "$SCRIPT_DIR/network_analysis.sh" ;;  # Run Network Analysis
            2) "$SCRIPT_DIR/disk_check.sh" ;;        # Perform Disk Check
            3) 
               if confirm_exit; then                 # Exit Confirmation
                   exit 0
               fi
               ;;
            *) whiptail --msgbox "Invalid option. Try again." 10 60 ;;  # Handle invalid input
        esac
    done
}

# Start application
require_login  # Require login before showing the menu
main_menu      # Display the main menu