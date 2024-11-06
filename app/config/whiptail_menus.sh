#!/bin/bash

# Function to display the main menu after login
function display_main_menu() {
    whiptail --title "DevOps Toolkit" --menu "Choose an option" 15 60 3 \
    "1" "Run Network Analysis" \
    "2" "Disk Check" \
    "3" "Exit" 3>&1 1>&2 2>&3
}

# Function to confirm exit
function confirm_exit() {
    whiptail --yesno "Are you sure you want to exit?" 10 60 --title "Confirm Exit"
}
