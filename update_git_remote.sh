#!/bin/bash

# Function to update Git remote URL
update_git_remote() {
    local host_alias=$1
    local username=$2
    local repo_name=$3
    local remote_url="git@$host_alias:$username/$repo_name.git"

    if [ ! -d .git ]; then
        echo "This directory is not a Git repository."
        while true; do
            read -p "Would you like to clone it from GitHub? (y/n): " clone_choice
            if [[ $clone_choice == [yY] ]]; then
                git clone "$remote_url" "$repo_name" && cd "$repo_name" || return
                echo "Changed directory to '$repo_name'."
                break
            else
                echo "Exiting script. Please initialize a Git repository manually."
                return
            fi
        done
    else
        git remote set-url origin "$remote_url"
        echo "Remote URL updated to: $remote_url"
    fi
}
