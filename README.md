> NOTE: This report is managed by [GNU strow](https://www.gnu.org/software/stow/).

# Showcase

Terminal Emulator - [WezTerm](https://wezfurlong.org/wezterm/index.html)

![wezterm screenshot](images/wezterm.png)

# Getting started

1. Install [GNU strow](https://www.gnu.org/software/stow/)

```bash
# MacOS (using homebrew package manager)
brew install strow
```

2. Clone this repo into your home directory

> Backup your `dotfiles` folder first if you have one. (`mv ~/dotfiles ~/dotfiles.bk`)

```bash
git clone https://github.com/Al3bad/dotfiles.git
```

3. Backup any config files that might be overwritten by `strow`.

4. Navigate to the cloned repo

```bash
cd dotfiles
```

5. Put config files into your system using `strow`.

```bash
strow wezterm
```
