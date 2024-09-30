README.txt
==========

Multi-GitHub Account Setup Script
---------------------------------

This script simplifies the process of managing multiple GitHub accounts on a single machine by handling SSH keys, Git configuration, and aliases. It allows for quick switching between different GitHub accounts using custom Git aliases.

Features:
---------
- Automatically detect and use existing SSH keys or generate new ones.
- Update SSH configuration for each GitHub account.
- Create Git aliases in `.bashrc` to switch between accounts easily.
- Option to override existing configurations.
- Add SSH keys to the SSH agent for easy GitHub authentication.

Prerequisites:
--------------
Before running the script, make sure you have the following installed:
- Git (`>= 2.x`)
- OpenSSH (`>= 7.x`)
- Bash shell (`>= 4.x`)

Usage Guide:
------------

1. **Clone the Repository or Create the Script**

   - Clone the repository where this script is located:
     ```bash
     git clone https://github.com/<your-username>/<repo-name>.git
     ```

   - Or create the script manually by copying the content into a file:
     ```bash
     nano setup_multiple_github_accounts.sh
     ```

   - Paste the script content and save the file.

2. **Make the Script Executable**

   Run the following command to make the script executable:
   ```bash
   chmod +x setup_multiple_github_accounts.sh

