# KoruX Build

I am using `live-build` version *20250505* in a sid environment.

$ sudo apt-get update
$ sudo apt-get install -y live-build
$ sudo make build

Final file: korux-live-0.01-amd64-xfce.iso

## Features of KoruX

* All essential packages are pre-installed via
  [pkgs.list.chroot](https://github.com/KoruX-GNU-Linux/KoruX/blob/master/config/package-lists/pkgs.list.chroot),
  including tools for development, system administration, multimedia,
  entertainment, desktop themes, networking, and system utilities. This ensures
  the system is ready for any task right out of the box.

* Latest Docker version is pre-installed for easy and secure container
  management.

* The default desktop environment features the custom korux-theme, set via
  `update-alternatives` for a distinctive look and feel. The PxPlus Cordata PPC-400
  font is included in the distribution and used by default, further enhancing the
  unique appearance.

* GRUB bootloader comes with a custom configuration, offering a visually
  recognizable and user-friendly startup experience.

* The default GRUB configuration includes custom kernel parameters for
  improved system behavior and debugging. The options `net.ifnames=0` and
  `biosdevname=0` ensure traditional network interface naming (like eth0) for
  consistency and easier management. `slub_debug=P`, `slab_nomerge`, and
  `page_poison=1` enable advanced memory debugging features, helping to detect and
  diagnose potential issues such as memory corruption or use-after-free bugs.
  Together, these parameters provide a more predictable environment and enhanced
  diagnostics, especially valuable for developers and advanced users.

* The `how-can-i-help.service` runs at startup and creates helpful files in the
  user’s home directory with suggestions for contributing to Debian development.
  Files provide both general and newcomer-focused guidance, with restricted
  permissions for privacy, giving contributors immediate, actionable tips.

* The `clean-home` script provides an automated cleanup option during system
  shutdown or reboot. It removes temporary and history files—such as
  `.bash_history`, `.gdb_history`, and others—from both root and user directories.
  The script also secures the `.ssh` directory by setting proper permissions and
  clears the local package cache to free disk space. This helps maintain privacy,
  security, and system efficiency, giving users a clean workspace each session.

* The `pam_faillock` module is used in the PAM configuration to protect against
  brute-force attacks. User accounts are locked for 10 minutes after five failed
  login attempts, helping prevent unauthorized access. The setup includes
  pre-authentication checks, failure audits, and resets after successful
  authentication, adding an extra layer of security.

* A custom Firefox `user.js` configuration enhances privacy, security, and
  usability with a minimalist approach. Telemetry, crash reporting, Pocket,
  search suggestions, trending sites, and interface animations are disabled to
  reduce data sharing and distractions. HTTPS-only mode is enforced, form autofill
  is disabled, and selected data is cleared on shutdown for added privacy.
  Additional tweaks simplify the new tab page, URL bar, and toolbar, providing a
  cleaner and more focused browsing experience.

* The `~/.local/bin` directory includes scripts to simplify routine developer
  tasks, such as `apt-recent-installs.sh` for tracking package installations,
  `deb-clean.sh` for cleaning up package files, tools for creating archives, and
  other useful utilities.

* A highly minimalistic XFCE desktop setup is provided, focused on efficiency and
  a clean workspace, with no desktop icons and extensive use of keyboard shortcuts
  for fast navigation. XFCE settings in `~/.config/xfce4` are tailored for
  streamlined terminal, keyboard, and window management, while numerous
  customizable terminal color schemes are available in
  `~/.local/share/xfce4/terminal/colorschemes`. This configuration delivers a
  clutter-free, keyboard-driven environment ideal for users who value speed and
  simplicity.

* The `sshd_config` is carefully hardened to prioritize security and minimize
  exposure to common attack vectors. It restricts insecure authentication methods
  and enforces best practices for remote access, integrating with the system’s
  authentication framework. This provides a secure default setup for users who
  value robust protection in their SSH environment.

* The OpenSSL configuration is set up for secure certificate management and
  communications, with an added section enabling support for GOST cryptographic
  algorithms. This expands the system’s compatibility to include Russian
  cryptographic standards, making it suitable for environments requiring GOST
  support alongside standard OpenSSL features.

* Pre-configured installation scripts for classic games like Diablo, Heroes 3, and
  the Quake series are available in `/opt/game-ports`. Users can easily install
  these games by running the provided `install.sh` scripts, which handle secure
  downloading and setup automatically. This streamlines game installation and
  avoids the need for manual configuration.
