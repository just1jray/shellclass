#!/bin/bash
# Add some accounts to test with
if [[ $UID -ne 0 ]]
then
	echo "Please run with sudo or as root." >&2
	exit
fi

for U in willyd cardib dollyp donc frankz
do
	useradd $U
	echo 'pass123' | passwd --stdin $U
done
