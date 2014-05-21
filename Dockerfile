# BUILD-USING:        $ docker build -t data .
# RUN-USING:          $ docker run -name DATA data
FROM busybox
MAINTAINER Mike Pirog <mike@kalamuna.com>

# Build the data dirs
RUN mkdir -p /data/data
RUN mkdir -p /data/code
RUN mkdir -p /data/files

# Set volume permissions
RUN chmod 755 /data/data
RUN chmod 755 /data/code
RUN chmod 755 /data/files

# This is a weird bug that sets the permissions incorrectly on an empty VOLUME
# https://github.com/dotcloud/docker/issues/2969
RUN touch /data/data/.docker-volume-perm-fix
RUN touch /data/code/.docker-volume-perm-fix
RUN touch /data/files/.docker-volume-perm-fix
RUN chmod 666 /data/data/.docker-volume-perm-fix
RUN chmod 666 /data/code/.docker-volume-perm-fix
RUN chmod 666 /data/files/.docker-volume-perm-fix

VOLUME ["/data/data", "/data/code", "/data/files"]

CMD ["/bin/true"]
