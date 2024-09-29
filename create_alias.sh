#!/bin/bash

# Function to create an alias in .bashrc
create_alias() {
    local host_alias=$1
    local username=$2
    local repo_name=$3
    echo "alias $host_alias='git remote set-url origin git@$host_alias:$username/$repo_name.git'" >> ~/.bashrc
}
