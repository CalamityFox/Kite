# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
# COPY build_files /
COPY sysfiles /sysfiles

# Base Image
FROM quay.io/fedora/fedora-silverblue:latest

# Other base images:
# Universal Blue - github.com/orgs/ublue-os/packages
# Fedora --------- quay.io/fedora
# CentOS --------- quay.io/centos-bootc

### Make /opt immutable
RUN rm /opt && mkdir /opt

RUN <<-'EOT' sh
set -ouex pipefail
# cp -avf "ctx/sysfiles" /
systemctl enable podman.socket
 
# RPM Fusion
dnf5 install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
		
addPackages=(
 niri
 noctalia
)
dnf5 install -y "${addPackages[@]}"
  
removePackages=(
 gnome-shell
 gnome-shell-extension-common
 gnome-shell-extension-background-logo
 gnome-shell-extension-window-list
 # gnome-classic-session
)
rpm-ostree override remove "${removePackages[@]}"
  
addFlatpak=(
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
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --noninteractive --assumeyes flathub "${addFlatpak[@]}"
flatpak update --assumeyes

	
	
EOT

# Run build.sh
# RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    # --mount=type=cache,dst=/var/cache \
    # --mount=type=cache,dst=/var/log \
    # --mount=type=tmpfs,dst=/tmp \
    # /ctx/build.sh

# Verify final image
RUN bootc container lint
