#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# System Packages
dnf5 install -y nautilus niri noctalia

dnf5 remove -y "gnome-shell*"
dnf5 remove -y gnome-shell gnome-desktop

# Flatpak configuration
dnf5 install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y            app.devsuite.Ptyxis
flatpak install -y            app.drey.Warp
flatpak install -y            com.calibre_ebook.calibre
flatpak install -y            com.github.johnfactotum.Foliate
flatpak install -y            com.github.tchx84.Flatseal
flatpak install -y            io.freetubeapp.FreeTube
flatpak install -y            io.github.kolunmi.Bazaar
flatpak install -y            io.github.tanaybhomia.Whisp
flatpak install -y            io.gitlab.adhami3310.Impression
flatpak install -y            io.gitlab.librewolf-community
flatpak install -y            org.gnome.Calculator
flatpak install -y            org.gnome.FileRoller
flatpak install -y            org.gnome.Loupe
flatpak install -y            org.gnome.Papers
flatpak install -y            org.gnome.Showtime
flatpak install -y            org.gnome.TextEditor
flatpak install -y            org.gnome.Weather
flatpak install -y            org.gnome.World.PikaBackup
flatpak install -y            org.gnome.World.Secrets
flatpak install -y            org.libreoffice.LibreOffice
flatpak install -y            org.mozilla.thunderbird
flatpak install -y            org.signal.Signal
flatpak install -y            page.codeberg.libre_menu_editor.LibreMenuEditor

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
