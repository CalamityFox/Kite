#!/bin/bash
set -ouex pipefail
cp -avf "/ctx/system_files"/. /
systemctl enable podman.socket

# System Packages
dnf5 install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
PACKAGES=(
  niri
  noctalia
)
dnf5 install -y "${PACKAGES[@]}"
dnf5 update -y

# COPR
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# dnf5 -y copr disable ublue-os/staging
