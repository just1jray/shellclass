#!/bin/bash

# The script:
#
# Is named "add-local-user.sh".

# Enforces that it be executed with superuser (root) privileges.  If the script is not executed with superuser privileges it will not attempt to create a user and returns an exit status of 1.
if [[ "${UID}" -ne 0 ]]
then
  echo "Root privileges required to run script."
  exit 1
fi

# Prompts the person who executed the script to enter the username (login), the name for person who will be using the account, and the initial password for the account.
read -p 'Enter the username to create: ' USER_NAME
read -p 'Enter the name of the person who this account is for: ' COMMENT
read -p 'Enter the password to use for this account: ' PASSWORD

# Creates a new user on the local system with the input provided by the user.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Informs the user if the account was not able to be created for some reason.  If the account is not created, the script is to return an exit status of 1.
if [[ "${?}" -ne 0 ]]
then
  echo "Failed to create user."
  exit 1
fi
# echo ${?}

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
  echo "Failed to update password."
  exit 1
fi

passwd -e ${USER_NAME}

# Displays the username, password, and host where the account was created.  This way the help desk staff can copy the output of the script in order to easily deliver the information to the new account holder.
echo "User account created successfully."
echo "Username: $USER_NAME"
echo "Password: $PASSWORD"
echo "Host: $HOSTNAME"
