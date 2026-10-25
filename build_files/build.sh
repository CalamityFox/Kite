#!/bin/bash
set -ouex pipefail
cp -avf "/ctx/system_files"/. /
systemctl enable podman.socket

# RPM Fusion
dnf5 install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# System Packages
PACKAGES=(
  aajohan-comfortaa-fonts                            # Comfortaa font
  akmods                                             # Manage kernel modules
  broadcom-wl                                        # WiFi driver for Broadcom chipsets
  flatpak                                            # Sandboxed apps
  gdm                                                # Terminal
  nautilus                                           # GNOME file manager
  niri                                               # Wayland compositor
  noctalia                                           # Shell
)
dnf5 install -y "${PACKAGES[@]}"

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

FLATPAKS=(
  app.devsuite.Ptyxis                                # Terminal
  app.drey.Warp                                      # File sharing using magic-wormhole
  com.github.johnfactotum.Foliate                    # E-Book reader
  com.github.tchx84.Flatseal                         # Flatpak permission manager
  de.haeckerfelix.Fragments                          # Torrent client
  io.github.kolunmi.Bazaar                           # GUI Flatpak manager
  io.github.tanaybhomia.Whisp                        # Notes
  io.gitlab.adhami3310.Impression                    # ISO flasher
  io.gitlab.librewolf-community                      # Browser
  org.gnome.Calculator                               # Calculator
  org.gnome.FileRoller                               # Archive utility
  org.gnome.Loupe                                    # Image viewer
  org.gnome.Papers                                   # Document viewer/editor
  org.gnome.Showtime                                 # Video player
  org.gnome.TextEditor                               # Text editor
  org.gnome.Weather                                  # Weather
  org.gnome.World.Iotas                              # Notes
  org.gnome.World.PikaBackup                         # Backup tool
  org.gnome.World.Secrets                            # KeePass password manager
  org.libreoffice.LibreOffice                        # Office suite
  org.mozilla.thunderbird                            # E-Mail client
  org.signal.Signal                                  # Signal Messenger
  page.codeberg.libre_menu_editor.LibreMenuEditor    # Edit application menu
  page.tesk.Refine                                   # Desktop tweaks
)
flatpak install --noninteractive --assumeyes flathub "${FLATPAKS[@]}"

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
