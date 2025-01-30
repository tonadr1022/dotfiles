#!/bin/bash

# Prompt for user name and email
read -p "Enter your name: " name
read -p "Enter your email: " email

# Confirm the values entered
echo "Name: $name"
echo "Email: $email"

# Ask for confirmation before applying settings
read -p "Is this information correct? (y/n): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
	# Set the Git configuration (optional use case)
	git config --global user.name "$name"
	git config --global user.email "$email"
	echo "Name and email have been set."
else
	echo "Operation cancelled."
fi
