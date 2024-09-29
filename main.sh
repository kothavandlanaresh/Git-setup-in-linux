#!/bin/bash

# Main execution script
echo "This script will set up SSH keys, update Git remote, and create aliases."

# Source the other scripts
source "$(dirname "$0")/generate_key.sh"
source "$(dirname "$0")/append_host.sh"
source "$(dirname "$0")/get_host_aliases.sh"
source "$(dirname "$0")/setup_git_user.sh"
source "$(dirname "$0")/update_git_remote.sh"
source "$(dirname "$0")/create_alias.sh"

# Generate SSH key if needed
generate_key

# Check for existing hosts
existing_hosts=($(get_host_aliases))

# Prompt for Host alias
if [[ ${#existing_hosts[@]} -gt 0 ]]; then
    echo "Using existing host: ${existing_hosts[0]}"
    host_name="${existing_hosts[0]}"
else
    read -p "Enter a descriptive name for the Host: " host_name
fi

# Show available SSH keys
read -p "Do you want to see a list of available SSH keys? (y/n): " display_keys
if [[ $display_keys == [yY] ]]; then
    echo "Available SSH keys:"
    ls "$HOME/.ssh" | grep -v -E 'config|known_hosts'
fi

# Prompt for private key file name
read -p "Enter the private key file name (without .pub extension): " keyname
identity_file="$HOME/.ssh/$keyname"

if [ ! -f "$identity_file" ]; then
    echo "Error: Key file '$identity_file' does not exist."
    exit 1
fi

append_host "$host_name" "$identity_file"

# Prompt for GitHub username and repository name
read -p "Enter your GitHub username: " username
read -p "Enter the repository name: " repo_name

# Update the Git remote URL
update_git_remote "$host_name" "$username" "$repo_name"

# Set up Git user identity
setup_git_user

# Create the alias
create_alias "$host_name" "$username" "$repo_name"

# Source .bashrc to make the alias available immediately
source ~/.bashrc

echo "Setup completed successfully!"

