#!/bin/bash

# Define Backup Directory

BACKUP_DIR="/backup"
mkdir -p "$BACKUP_DIR"



# Fuction to add a new user

      add_user() {
    read -r -p "Enter the username to add: " username

    # Ensure username is not empty
    if [[ -z "$username" ]]; then
        echo "Error: Username cannot be empty."
        return
    fi

    # Ensure username is valid (only letters, numbers, and underscores)
    if ! [[ "$username" =~ ^[a-zA-Z0-9_]+$ ]]; then
        echo "Error: Invalid username. Use only letters, numbers, and underscores."
        return
    fi

    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        sudo useradd -m "$username"
        sudo passwd "$username"
        echo "User '$username' added successfully."
    fi
}




# Function to delete a user
delete_user() {
        read -p "Enter the username to delete: " username
        if id "$username" &>/dev/null; then
                sudo userdel -r "$username"
                echo "User '$username' deleted successfully."
        else
                echo "User '$username' does not exit."
        fi

}

# Function to list all users
list_users() {
        echo "List of all  users:"
        awk -F: '($3 >= 1000) {print $1}' /etc/passwd
}

# Function to create a Backup
create_backup() {
        TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
        BACKUP_FILE="$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz"

        echo "Creating backup..."
    
    # Ensure the backup directory exists
    if [ ! -d "$BACKUP_DIR" ]; then
        echo "Backup directory does not exist. Creating it now..."
        sudo mkdir -p "$BACKUP_DIR"
        sudo chmod 777 "$BACKUP_DIR"
    fi

    # Create backup and check for errors
    sudo tar -czf "$BACKUP_FILE" /home 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Backup created successfully: $BACKUP_FILE"
    else
        echo "Error: Backup creation failed!"
        return
    fi
  # Keep only the latest 5 backups
        echo "Removing old backups..."
        ls -lt "$BACKUP_DIR"/home_backup_* | tail -n +6 | xargs rm -f
}
# Main menu
while true; do
        echo "==============================="
        echo " User Management & Backup Script "
        echo "==============================="
        echo "1. Add User"
        echo "2. Delete User"
        echo "3. List Users"
        echo "4. Create Backup"
        echo "5. Exit"
        echo "================================"
        
# Improved Input Handling
    read -r -p "Enter your choice (1-5): " choice
    choice=$(echo "$choice" | tr -d '[:space:]')  # Remove spaces & newlines

    # Ensure only numbers 1-5 are accepted
    if ! [[ "$choice" =~ ^[1-5]$ ]]; then
        echo "Invalid choice. Please enter a number between 1 and 5."
        continue  # Go back to menu
    fi
        case $choice in
                1) add_user ;;
                2) delete_user ;;
                3) list_users ;;
                4) create_backup ;;
                5) echo "Exiting script. Goodbye!"; exit 0 ;;
                *) echo "Invaild choice. Please try again." ;;

        esac
done

