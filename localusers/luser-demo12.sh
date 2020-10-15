#!/bin/bash

# This script deletes a user.

if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or as root.' >&2
	exit 1
fi

# Assume the first argument is the user to delete.
USER="${1}"

# Delete the user.
userdel ${USER}

# Make sure the user was successfully deleted.
if [[ "${?}" -ne 0 ]]
then
	echo "The account ${USER} was NOT deleted." >&2
	exit 1
fi

# Tell the user if the account was deleted successfully.
echo "The account ${USER} was deleted successfully."

exit 0