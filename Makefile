LN := ln -svf
MKDIR := mkdir -p
OS := $(shell uname)
CONFIG := $(PWD)/config
XDG_CONFIG := $(HOME)/.config
XDG_LOCAL := $(HOME)/.local

# Define the stow command and the target directory
STOW := stow
STOW_DIR := ~/dotfiles

# List of packages (subdirectories in your dotfiles directory)
PACKAGES := package1 package2 package3

# Additional directories
CONFIG := .config
SCRIPTS := scripts

# Default target: stow all packages, .config, and scripts
all: $(PACKAGES) $(CONFIG) $(SCRIPTS)

# Target to stow a specific package
$(PACKAGES):
	$(STOW) -R $@

# Target to unstow a specific package
uninstall-%:
	$(STOW) -D $*

# Target to stow .config
$(CONFIG):
	$(STOW) -R -t $(HOME) $@

# Target to stow scripts
$(SCRIPTS):
	$(STOW) -R -t $(HOME)/.local/bin $@

# Target to clean up (unstow) all packages, .config, and scripts
clean:
	@for pkg in $(PACKAGES) $(CONFIG) $(SCRIPTS); do \
		$(STOW) -D $$pkg; \
	done

# Help target to display usage information
help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  all              Stow all packages, .config, and scripts"
	@echo "  clean            Unstow all packages, .config, and scripts"
	@echo "  <package>        Stow a specific package (e.g., package1)"
	@echo "  uninstall-<package> Unstow a specific package (e.g., uninstall-package1)"
	@echo "  .config          Stow the .config directory"
	@echo "  scripts          Stow the scripts directory"
	@echo "  uninstall-.config Unstow the .config directory"
	@echo "  uninstall-scripts Unstow the scripts directory"

.PHONY: all clean $(PACKAGES) $(CONFIG) $(SCRIPTS) help