<!--
*** This readme was adapted from Best-README-Template.
  https://github.com/othneildrew/Best-README-Template
-->

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

<a href="https://github.com/Kaweees/nvim">
  <img alt="Neovim Logo" src="assets/img/nvim.png" align="right" width="150">
</a>

<div align="left">
  <h1><em><a href="https://miguelvf.dev/blog/dotfiles/nvim">~nvim</a></em></h1>
</div>

<!-- ABOUT THE PROJECT -->

My custom configurations for neovim with an emphasis on functionality and efficiency.

### Built With

[![Neovim][Neovim-shield]][Neovim-url]
[![Lua][Lua-shield]][Lua-url]
[![GitHub Actions][github-actions-shield]][github-actions-url]

<!-- PROJECT PREVIEW -->
## Preview

<p align="center">
  <img src="assets/img/screenshot.png"
  width = "80%"
  alt = "StartupTime"
  />
</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Before attempting to build this project, make sure you have [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md), a [Nerd Font](https://www.nerdfonts.com) installed on your machine, and terminal that supports [24-bit truecolor](https://github.com/termstandard/colors) and Unicode undercurl (special underlines under text).

### Installation

To get a local copy of the project up and running on your machine, follow these simple steps:

1. Clone the project repository

   ```sh
   git clone https://github.com/Kaweees/nvim.git
   cd nvim
   ```

2. Create a symlink from the cloned folder to where neovim expects its configuration to be located. Personally, I use [ansible](https://github.com/Kaweees/ansible/) to create symlinks for all of my [dotfiles](https://github.com/Kaweees/dotfiles/). If you are not sure where it is, check `$XDG_CONFIG_HOME/nvim` or Neovim's configurations are located under the following paths, depending on your OS:
   | Operating System | File Path |
   | :- | :--- |
   | Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
   | Windows (cmd)| `%userprofile%\AppData\Local\nvim\` |
   | Windows (powershell)| `$env:USERPROFILE\AppData\Local\nvim\` |

   If you are still unsure, run one of these commands to find out:

   ```sh
   :echo stdpath('config') # Execute while in nvim
   :h rtp # Execute while in nvim
   ```

5. If you want to use the [WakaTime](https://wakatime.com) plugin, configure your API key.

   ```sh
   :WakaTimeApiKey # Execute while in nvim
   ```

6. If you want to use the [GitHub Copilot](https://github.com/zbirenbaum/lua/) plugin, authenticate your account by executing the following command while in nvim.

   ```sh
   :Copilot auth
   ```

<!-- USAGE EXAMPLES -->
## Usage

### Available Plugins

* [packer.nvim](https://github.com/wbthomason/packer.nvim/) : This plugin is an easy-to-use plugin manager and installs all of the other plugins listed here.
* [telescope.nvim](https://github.com/pnvim-telescope/telescope.nvim/) : This plugin provides extensible fuzzy finder over lists.
* [harpoon](https://github.com/ThePrimeagen/harpoon2) : This plugin provides a quick way to switch between specific files in a project and execute project specific commands.
* [vim-wakatime](https://github.com/wakatime/vim-wakatime/) : This plugin allows programming activity to automatically be tracked and displayed in your WakaTime dashboard.
* [copilot.lua](https://github.com/zbirenbaum/copilot.lua/) : This plugin provides an efficent way to use GitHub Copilot AI to generate code snippets.

_To see all of the available plugins, please refer to [packer.lua](./lua/config/packer.lua)_

### Keyboard Shortcuts

To enter custom commands into nvim, you must first enter a specific keybind, which is called the leader, followed by the command keybind while in a specific editor mode. My prefix key is <kbd>space</kbd>.

To refresh neovim and install new plugins, type <kbd>leader</kbd> + <kbd>I</kbd> (capital i, as in Install) while in normal mode.

<!-- | Mode | Command Keybind | Command Description |
| ---- | --------------- | ------------------- |
| normal | <kbd>leader</kbd> + <kbd>c</kbd> | create new window and switch to it |
| a | <kbd>leader</kbd> + <kbd>#</kbd> | switch to window # |
| a | <kbd>leader</kbd> + <kbd>n</kbd> | switch to next window |
| a | <kbd>leader</kbd> + <kbd>p</kbd> | switch to previous window |
| a | <kbd>leader</kbd> + <kbd>:</kbd> | swap window with next window |
| a  | <kbd>leader</kbd> + <kbd>;</kbd> | swap window with previous window |
| a   | <kbd>leader</kbd> + <kbd>&</kbd> | kill window and all panes in it | -->

<!-- Normal | `<leader>` + `p` + `v` | Execute `:PackerSync` | -->

<!-- PROJECT FILE STRUCTURE -->
## Project Structure

```sh
~/.config/nvim
├── after/plugins/                 - plugin-specific configurations
├── lua
│   ├── config
│   │   ├── lazy.lua               - packages installed by lazy.nvim
│   │   ├── remap.lua              - keybinds and leader configuration
│   │   └── set.lua                - miscellaneous settings
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
├── init.lua                       - Entry point, loads all plugins and configurations
└── README.md                      - you are here
```

## License

The source code for my website is distributed under the terms of the GNU General Public License v3.0, as I firmly believe that collaborating on free and open-source software fosters innovations that mutually and equitably beneficial to both collaborators and users alike. See [`LICENSE`](./LICENSE) for details and more information.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/Kaweees/nvim.svg?style=for-the-badge
[contributors-url]: https://github.com/Kaweees/nvim/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Kaweees/nvim.svg?style=for-the-badge
[forks-url]: https://github.com/Kaweees/nvim/network/members
[stars-shield]: https://img.shields.io/github/stars/Kaweees/nvim.svg?style=for-the-badge
[stars-url]: https://github.com/Kaweees/nvim/stargazers

<!-- MARKDOWN SHIELD BAGDES & LINKS -->
<!-- https://github.com/Ileriayo/markdown-badges -->
[Neovim-shield]: https://img.shields.io/badge/neovim-%23008080.svg?style=for-the-badge&logo=neovim&logoColor=5fb950&labelColor=222222&color=5fb950
[Neovim-url]: https://neovim.io/
[Lua-shield]: https://img.shields.io/badge/lua-%23008080.svg?style=for-the-badge&logo=lua&logoColor=000080&labelColor=222222&color=000080
[Lua-url]: https://www.lua.org
[github-actions-shield]: https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=2671E5&labelColor=222222&color=2671E5
[github-actions-url]: https://github.com/features/actions
