#!/bin/bash

# Function to display available host aliases
get_host_aliases() {
    local config_file="$HOME/.ssh/config"
    local hosts=()
    if [[ -f $config_file ]]; then
        read -p "Do you want to see the available host aliases? (y/n): " display_choice
        if [[ $display_choice == [yY] ]]; then
            echo "Available host aliases:"
            hosts=($(grep -aE 'Host ' "$config_file" | awk '{print $2}')) # Use -a to treat as text
            printf '%s\n' "${hosts[@]}"
        fi
    else
        echo "SSH config file not found."
    fi
    echo "${hosts[@]}"  # Return available hosts
}

