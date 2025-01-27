<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<div align="left">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]

</div>

<div align="left">
  <h1><em><a href="https://miguelvf.dev/blog/dotfiles/compendium">~/.dotfiles</a></em></h1>
</div>

<!-- ABOUT THE PROJECT -->

This is my personal collection of configuration files. The [setup section](#installation) will guide you through the installation process.

### Built With

[![NixOS][NixOS-shield]][NixOS-url]

### Thanks for dropping by

<img src="assets/img/screenshot.png" alt="Screenshot of my desktop" align="right" width="400px">

Here are some details about my setup:

+ **Operating System**: [Debian 12 ("bookworm")](https://www.debian.org/releases/bookworm/)
+ **Display Server**: [Xorg](https://www.x.org/wiki/)
+ **Notification Server** [dunst](https://github.com/dunst-project/dunst)
+ **Window Manager**: [dwm](https://tools.suckless.org/dwm/)
+ **Status Bar**: [slstatus](https://tools.suckless.org/slstatus/)
+ **Program Launcher**: [rofi](https://davatorium.github.io/rofi/)
+ **Terminal**: [st](https://st.suckless.org/)
+ **File Manager**: [Thunar](https://git.xfce.org/xfce/thunar/)
+ **Shell**: [zsh](https://www.zsh.org/)
+ **Editor**: [Neovim](https://neovim.io/)
+ **Browser**: [Vivaldi](https://vivaldi.com)
+ **Color Scheme**: [gruvbox](https://github.com/morhetz/gruvbox)
+ **Font**: [FiraCode Nerd Font](https://github.com/kranack/FiraCode) [(cheatsheet)](https://www.nerdfonts.com/cheat-sheet)

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Before attempting to build this project, make sure you have [git](https://mccd.space/posts/git-to-deploy/) installed on your machine. Additionally, you need to have [NixOS booted up (either live or installed)](https://nixos.org/download#download-nixos) or [Nix](https://nixos.org/download.html#nix) and [Home Manager](https://nix.dev/home-manager) installed on your existing distro (even on Darwin).

### Installation

> [!WARNING]  
> You can clone my dotfiles wherever you want, but some configurations expect it to be in `~/Documents/GitHub/dotfiles`. Change at your own risk.

To get a local copy of my dotfiles up and running on your machine, follow these simple steps:

1. Clone the project repository

   ```sh
   git clone https://github.com/Kaweees/dotfiles.git ~/Documents/GitHub/dotfiles
   cd ~/Documents/GitHub/dotfiles
   ```

2. Opt into the experimental [flakes](https://nixos.wiki/wiki/flakes) and [nix-command](https://nixos.wiki/wiki/Nix_command) features

   ```sh
   nix --version # should be Nix 2.4 or higher
   export NIX_CONFIG="experimental-features = nix-command flakes"
   ```

3. Generate your own [hardware-configuration.nix](./nixos/hardware-configuration.nix) file and apply them to the configuration.

   ```sh
   nixos-generate-config --root /mnt/nixos
   cp /mnt/nixos/etc/nixos/hardware-configuration.nix ./nixos/hardware-configuration.nix
   ```

4. Update the flake inputs

   ```sh
   nix flake update
   ```

5. Apply the system configurations

   + If you are on an installed system

      ```sh
      sudo nixos-rebuild switch --flake .#hostname
      ```

   + If you are on a live installation medium

      ```sh
      nixos-install --flake .#hostname && reboot
      ```

<!-- PROJECT FILE STRUCTURE -->
## Project Structure

```sh
. dotfiles/
├── .config -> ~/.config           - configuration files for various services
├── .local -> ~/.local             - local data files for various services
├── .scripts -> ~/.scripts         - scripts available to the user at runtime
└── README.md                      - you are here
```

## License

The source code for my dotfiles is distributed under the terms of the GNU General Public License v3.0, as I firmly believe that collaborating on free and open-source software fosters innovations that mutually and equitably beneficial to both collaborators and users alike. See [`LICENSE`](./LICENSE) for details and more information.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/Kaweees/dotfiles.svg?style=for-the-badge
[contributors-url]: https://github.com/Kaweees/dotfiles/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Kaweees/dotfiles.svg?style=for-the-badge
[forks-url]: https://github.com/Kaweees/dotfiles/network/members
[stars-shield]: https://img.shields.io/github/stars/Kaweees/dotfiles.svg?style=for-the-badge
[stars-url]: https://github.com/Kaweees/dotfiles/stargazers

<!-- MARKDOWN SHIELD BAGDES & LINKS -->
<!-- https://github.com/Ileriayo/markdown-badges -->
[NixOS-shield]: https://img.shields.io/badge/NIXOS-%23008080.svg?style=for-the-badge&logo=NixOS&logoColor=5277C3&labelColor=222222&color=5277C3
[NixOS-url]: https://nixos.org/
