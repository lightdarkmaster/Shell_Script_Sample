#!/bin/bash

users_file="users.txt"

echo "Login System"
echo -n "Enter username: "
read username

echo -n "Enter password: "
read -s password
echo

hashed_password=$(echo -n "$password" | sha256sum | cut -d ' ' -f 1)

while IFS=: read -r user stored_hash; do
    if [[ "$user" == "$username" && "$stored_hash" == "$hashed_password" ]]; then
        echo "Login successful!"
        exit 0
    fi
done < "$users_file"

echo "Login failed. Invalid credentials."
exit 1
