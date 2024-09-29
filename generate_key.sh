#!/bin/bash

# Function to create SSH keys
generate_key() {
    local ssh_dir="$HOME/.ssh"
    local config_file="$ssh_dir/config"

    # Create SSH directory and config file if they do not exist
    mkdir -p "$ssh_dir"
    chmod 700 "$ssh_dir"
    touch "$config_file"
    chmod 600 "$config_file"

    read -p "Do you already have an SSH key? (y/n): " has_key
    if [[ $has_key == [yY] ]]; then
        echo "Skipping SSH key generation."
        return
    fi

    read -p "Do you want to see a list of existing SSH keys? (y/n): " display_choice
    if [[ $display_choice == [yY] ]]; then
        echo "Existing SSH keys:"
        ls "$ssh_dir" | grep -v -E 'config|known_hosts'
    fi

    read -p "Enter the filename for your SSH key (without extension): " filename
    read -p "Enter your email for the SSH key comment: " email

    local filepath="$ssh_dir/$filename"

    if [[ -f "$filepath" ]]; then
        read -p "File '$filepath' already exists. Do you want to overwrite it? (y/n): " choice
        [[ $choice != [yY] ]] && return
    fi

    ssh-keygen -t ed25519 -f "$filepath" -C "$email" -N ""
    echo "SSH key generated successfully: $filepath"
    cat "$filepath.pub"
}
