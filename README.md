# CalamityFox/Kite

GNU/Linux [bootc](https://bootc.dev)/[rpm-ostree](https://coreos.github.io/rpm-ostree) image based off of [Universal Blue](https://universal-blue.org).

The image currently uses [Niri](https://github.com/niri-wm/niri) and [Noctalia Shell](https://noctalia.dev/shell), but a switch to Noctalia's [Umbriel](https://noctalia.dev/umbriel) Wayland compositor is being considered.

# Installation
### Fresh install
ISO builds are in the works, but aren't a priority right now.
### Rebasing
You can rebase from an existing bootc or rpm-ostree system:
```
# rebasing with bootc
sudo bootc switch --enforce-container-sigpolicy ghcr.io/calamityfox/kite:latest

# rebasing with rpm-ostree
rpm-ostree rebase ostree-unverified-registry:ghcr.io/calamityfox/kite
```
