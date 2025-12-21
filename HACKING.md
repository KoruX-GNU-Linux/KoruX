## Build

I am using `live-build` version **20250505** in a sid environment.

```
$ sudo apt-get update
$ sudo apt-get install -y live-build
$ sudo make build
```

Final file: `korux-live-0.01-amd64-xfce.iso`

## Project structure

.
|
|-- ChangeLog - project changelog  
|-- HACKING.md - developer guide  
|-- LICENSE - project license  
|-- main-screenshot.png - system screenshot  
|-- Makefile - main build Makefile  
|-- README.md - general project information  
|
|-- auto/ - live-build automation scripts  
|  |-- build - build scripts  
|  |-- clean - cleanup scripts  
|  `-- config - build configuration  
|
|-- config/ - main configuration files and hooks  
   |
   |-- bootloaders/ - bootloader configuration  
   |  `-- grub-pc/ - theme, background, fonts, and GRUB2 configs  
   |
   |-- hooks/ - hooks for live and normal modes  
   |  |-- live/ - hooks for live mode  
   |  `-- normal/ - hooks for installed system (themes, cleanup, packages, security configs)  
   |
   |-- includes.chroot_after_packages/ - files added to chroot after package installation  
   |  |-- etc/ - system configs (openssl, pam, ssh, sudo, sysctl, skel, motd, os-release, etc.)  
   |  |-- opt/ - extra scripts and utilities (game installers, service scripts)  
   |  `-- usr/ - user data (fonts, themes, wallpapers, scripts)  
   |
   |-- package-lists/ - package lists for live and installed systems  
   |
   `-- packages.chroot/ - local deb packages (tests, game engines, calamares, etc.)
