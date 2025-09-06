#!/bin/bash

# Define the timeout in minutes
TIMEOUT=60

# Define the file to be created in sudoers.d
SUDOERS_FILE="/etc/sudoers.d/custom_timeout"

# Create the content for the new file
CONTENT="Defaults timestamp_timeout=${TIMEOUT}"

# Use a temporary file to hold the content
TEMP_FILE=$(mktemp)
echo "${CONTENT}" > "${TEMP_FILE}"

# Use visudo to check the syntax of the new file
# The -c flag checks the syntax, and the -f flag specifies the file to check
visudo -c -f "${TEMP_FILE}"

# Check the exit status of visudo
if [ $? -eq 0 ]; then
  echo "Syntax check passed. Applying changes..."

  # Set the correct permissions and ownership for the file
  # The file MUST be owned by root and have 0440 permissions
  sudo install -o root -g root -m 0440 "${TEMP_FILE}" "${SUDOERS_FILE}"

  echo "Sudo timeout successfully set to ${TIMEOUT} minutes."
else
  echo "Syntax check failed. No changes were made."
fi

# Clean up the temporary file
rm "${TEMP_FILE}"
