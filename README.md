<img src="media/logo-wide.png" width="600"/>

<img src="media/gendermalware.gif" width="450"/> <img src="media/queer.png" width="150"/>

<img src="media/sourcecodeforlife.gif" width="300"/> <img src="media/terminallyonline.gif" width="300"/> 

<img src="media/ancientinternetcreature.gif" width="300"/> <img src="media/dontrushme.gif" width="300"/>

**Risk** is a GNU/Linux system using [bootc](https://bootc.dev) and [rpm-ostree](https://coreos.github.io/rpm-ostree)

It uses [Niri](https://github.com/niri-wm/niri) with [Noctalia's shell](https://noctalia.dev/shell), and the [LibreWolf](https://librewolf.net) browser and various [GNOME](https://apps.gnome.org) apps.

# Installation
### Fresh install
ISO builds are in the works, but aren't a priority right now.
### Rebasing
You can rebase from an existing bootc or rpm-ostree system:
```
# rebasing with bootc
sudo bootc switch --enforce-container-sigpolicy ghcr.io/calamityfox/risk:latest

# rebasing with rpm-ostree
rpm-ostree rebase ostree-unverified-registry:ghcr.io/calamityfox/risk
```
