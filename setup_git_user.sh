#!/bin/bash

# Function to configure Git user identity for the current repository
setup_git_user() {
    read -p "Enter your GitHub email: " git_email
    read -p "Enter your GitHub username: " git_username
    git config user.email "$git_email"
    git config user.name "$git_username"
    echo "Git user identity configured for this repository!"
}
