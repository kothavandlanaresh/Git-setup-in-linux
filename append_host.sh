#!/bin/bash

# Function to append a host configuration
append_host() {
    local host=$1
    local identity_file=$2
    local config_file="$HOME/.ssh/config"

    if grep -q "Host $host" "$config_file"; then
        echo "Host configuration for '$host' already exists. Skipping."
        return
    fi

    {
        echo "# Configuration for $host"
        echo "Host $host"
        echo "    HostName github.com"
        echo "    User git"
        echo "    IdentityFile $identity_file"
        echo ""
    } >> "$config_file"
    echo "Host configuration for '$host' appended."
}
