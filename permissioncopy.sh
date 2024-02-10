#!/bin/bash

echo "**** create unraid user and make our folders ****"

# Source user
source_user="www-data"

# Get the UID and GID of the source user
source_uid=$(id -u $source_user)
source_gid=$(id -g $source_user)

# Find all files and directories owned by the source user
find / -user www-data -exec chown ${PUID}  {} + 2>/dev/null
usermod -u ${PUID} www-data
usermod -aG ${PGID} www-data

echo "Permissions copied from $source_user successfully."
