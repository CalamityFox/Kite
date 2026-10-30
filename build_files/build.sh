#!/bin/bash
set -ouex pipefail
cp -avf "/ctx/system_files"/. /
systemctl enable podman.socket
dracut -f

hostnamectl set-hostname "risk"

# System Packages
dnf5 install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
PACKAGES=(
  niri
  noctalia
)
dnf5 install -y "${PACKAGES[@]}"
dnf5 update -y

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
FLATPAKS=(
  app.devsuite.Ptyxis
  app.drey.Warp
  com.github.johnfactotum.Foliate
  com.github.tchx84.Flatseal
  de.haeckerfelix.Fragments
  io.github.kolunmi.Bazaar
  io.github.tanaybhomia.Whisp
  io.gitlab.adhami3310.Impression
  io.gitlab.librewolf-community
  org.gnome.Calculator
  org.gnome.FileRoller
  org.gnome.Loupe
  org.gnome.Papers
  org.gnome.Showtime
  org.gnome.TextEditor
  org.gnome.Weather
  org.gnome.World.Iotas
  org.gnome.World.PikaBackup
  org.gnome.World.Secrets
  org.libreoffice.LibreOffice
  org.mozilla.thunderbird
  org.signal.Signal
  page.codeberg.libre_menu_editor.LibreMenuEditor
  page.tesk.Refine
)
flatpak install --noninteractive --assumeyes flathub "${FLATPAKS[@]}"
flatpak update --assumeyes

# COPR
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# dnf5 -y copr disable ublue-os/staging
