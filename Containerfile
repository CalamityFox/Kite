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

RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
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
RUN flatpak install --noninteractive --assumeyes flathub "${FLATPAKS[@]}"
RUN flatpak update --assumeyes


# Run build.sh
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN hostnamectl set-hostname risk
RUN dracut -f

# Verify final image
RUN bootc container lint
