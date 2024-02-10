#!/bin/bash

echo "**** create unraid user and make our folders ****"
#groupmod -g ${PGID} users
#useradd -u ${PUID} -U -d /var/www -s /usr/bin/nologin unraid 
#usermod -G users unraid

# Source user
source_user="www-data"
# Target user
target_user="unraid"

# Get the UID and GID of the source user
source_uid=$(id -u $source_user)
source_gid=$(id -g $source_user)

# Find all files and directories owned by the source user
files=$(find / -user $source_uid)

# Copy permissions from source user to target user
#for file in $files; do
#    # Set ownership to target user
#    chown $target_user:$target_user $file
#    # Preserve permissions
#    chmod --reference=$file $file
#done
useradd --system --uid ${PUID} --no-create-home --home-dir /var/www --gid $(id -g www-data) --groups $(id -G www-data | sed 's/ /,/g') unraid

echo "Permissions copied from $source_user to $target_user successfully."

#echo '*/5 * * * * php -f /var/www/html/cron.php' > /var/spool/cron/crontabs/unraid
