# Risk: a Linux distro
![You're telling me a queer coded this?](https://github.com/CalamityFox/Risk/blob/main/media/queer.png){height=200} ![They/Them](https://github.com/CalamityFox/Risk/blob/main/media/theythem.png){height=200} ![Install gender malware](https://github.com/CalamityFox/Risk/blob/main/media/gendermalware.gif){height=200}

![I want the source code for life](https://github.com/CalamityFox/Risk/blob/main/media/sourcecodeforlife.gif){height=200} ![Terminally online](https://github.com/CalamityFox/Risk/blob/main/media/terminallyonline.gif){height=200} ![Ancient internet creature](https://github.com/CalamityFox/Risk/blob/main/media/ancientinternetcreature.gif){height=200} ![Don't rush me](https://github.com/CalamityFox/Risk/blob/main/media/dontrushme.gif){height=200}

GNU/Linux [bootc](https://bootc.dev)/[rpm-ostree](https://coreos.github.io/rpm-ostree) image based off of [Silverblue](https://fedoraproject.org/atomic-desktops/silverblue).

The image uses [Niri](https://github.com/niri-wm/niri) and [Noctalia Shell](https://noctalia.dev/shell).

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
