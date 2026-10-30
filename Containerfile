# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

# Base Image
FROM quay.io/fedora/fedora-silverblue:latest

# Other base images:
# Universal Blue      github.com/orgs/ublue-os/packages
# Fedora                    quay.io/fedora
# CentOS                   quay.io/centos-bootc

### Make /opt immutable
RUN rm /opt && mkdir /opt

# Run build.sh
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

# Verify final image
RUN bootc container lint
