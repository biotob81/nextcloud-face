# iamklaus - ENJOY IT
# Use a temporary image to compile and test the libraries
FROM nextcloud:latest as builder

ENV PUID=$PUID
ENV PGID=$PGID
RUN set -ex; \
    \
    find / -user $(id -u www-data) -exec chown 99 {} \; 2>/dev/null && \
    usermod -u 99 www-data && \
    usermod -aG 100 www-data

# Build and install dlib on builder
    
RUN apt-get update && apt-get install -y smbclient libsmbclient-dev \
    && pecl install smbclient \
    && docker-php-ext-enable smbclient \
    && rm -rf /var/lib/apt/lists/*
#
# At this point you meet all the dependencies to install the application
# If is available you can skip this step and install the application from the application store


RUN apt-get update && apt-get install -y libbz2-dev ffmpeg wget unzip nodejs npm aria2 python3-pip nano && \
    apt-get install -y wget unzip nodejs npm aria2 python3-pip nano && \
    docker-php-ext-install bz2 && \
    rm -rf /var/lib/apt/lists/*

#COPY permissioncopy.sh /docker-entrypoint-hooks.d/before-starting/
#RUN chmod +x /docker-entrypoint-hooks.d/before-starting/permissioncopy.sh
