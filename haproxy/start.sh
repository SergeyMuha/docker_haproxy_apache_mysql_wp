#!/bin/bash

__create_user() {
# Create a user to SSH into as.
#useradd user
SSH_USERPASS=534231
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (adduser sergey )
}

# Call all functions
__create_user

