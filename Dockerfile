FROM alpine
MAINTAINER Alexander Ustimenko "http://ustimen.co/"

# Init custom run and volumes dirs
RUN mkdir -p /dcr/cm.d /dcr/vol

# Copy tools to /usr/bin
COPY bin/* /usr/bin/

# Add hooks on before main command stage
COPY cm.d/* /dcr/cm.d/

# Allows us to read environment variables in CMD
ENTRYPOINT ["/bin/sh", "-c"]

# Allows us to customize default CMD by adding pre/post hooks
CMD ["for CMD in /dcr/cm.d/*; do source $CMD; done"]
