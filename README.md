<div align="center">
<img src="media/logo.png" width="250"/>

<img src="media/handcoded.png" width="100"/> <img src="media/theythem.png" width="100"/>

[`rpm-ostree`](https://coreos.github.io/rpm-ostree)/[`bootc`](https://bootc.dev) system based on [Universal Blue](https://universal-blue.org)

</div>

# <img src="media/favicon.gif" width="25"/> What is this?

I want to get better at basic development, and I've always had some issue with various pre-existing distros, so I'm making one for myself. If it ends up working well I might consider making it a "proper" distro, but for now this is purely a personal project.

It uses [`niri`](https://github.com/niri-wm/niri) with [`noctalia`](https://noctalia.dev/shell), as well as various [GNOME apps](https://apps.gnome.org) for basic functionality. For a list of all⁽¹⁾ pre-installed software, see [below](README.md#-pre-installed-software).

# <img src="media/favicon.gif" width="25"/> Installation

If you for some reason want to install this random assortment of code held together with duct tape and paperclips:

### Fresh install
ISO builds will happen... at some point. Right now I'm working on other things first

### Rebasing
You can rebase from an existing `rpm-ostree` or `bootc` system:
```
# Rebasing with bootc
sudo bootc switch --enforce-container-sigpolicy ghcr.io/calamityfox/risk:latest

# Rebasing with rpm-ostree
rpm-ostree rebase ostree-unverified-registry:ghcr.io/calamityfox/risk
```

# <img src="media/favicon.gif" width="25"/> Pre-installed software

`Risk` comes with some applications pre-installed. Those labelled as `RPM` cannot be uninstalled⁽²⁾, as they're part of the immutable system image. All other apps are packaged as Flatpaks and can be removed through the software manager:

- [`librewolf`](https://librewolf.net) browser
- [`loupe`](https://apps.gnome.org/Loupe) image viewer
- [`nautilus`](https://apps.gnome.org/Nautilus) file manager (RPM)
- [`showtime`](https://apps.gnome.org/Showtime) video player
- [`thunderbird`](https://www.thunderbird.net) e-mail client 

To install additional software, use [Flathub](https://flathub.org) where possible. If a package isn't available on Flathub, you can layer it with `rpm-ostree install $PACKAGE` (not recommended), or use [`distrobox`](https://distrobox.it).

# <img src="media/favicon.gif" width="25"/> Notes

⁽¹⁾The list may be slightly behind actual changes. For a fully up-to-date list, see the [`build.sh`](build_files/build.sh)

⁽²⁾Technically you can uninstall RPMs with `rpm-ostree override remove $PACKAGE` but this isn't recommended outside of the build process since it can cause system instability. 

⁽³⁾ ⁽⁴⁾



# <img src="media/favicon.gif" width="25"/> Contact

If you have any questions, suggestions or concerns, message me on [Signal](https://signal.org).

My username is [`kes.123`](https://signal.me/#eu/nM5aRSJ1kqOL0RtXQHOtgxqk6S5baJuLUNf4RxV1cu1ZIYaKd_dNBIZPvKpvRRZO) 

# 

<div align="center">
<img src="media/terminallyonline.gif" width="220"/> <img src="media/gendermalware.gif" width="220"/> <img src="media/ancientinternetcreature.gif" width="220"/> 

<img src="media/sourcecodeforlife.gif" width="220"/>  <img src="media/dontrushme.gif" width="220"/>
</div>
