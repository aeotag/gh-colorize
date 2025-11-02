# logmsg

[en]
### Universal Colorized Logger for Shell Scripts

**logmsg** is a colorized logging utility script for Bash and Fish, supporting systemd-journald via `systemd-cat` and automatic alias setup with package installation.

#### Features
- Color-coded log output for readability (ANSI escape codes and tput 256-colors)
- Journald integration for system logging
- Predefined log levels: info, warn, error, success, and custom
- System-wide aliases for Bash and Fish via package install

#### Installation

Debian/Ubuntu:

sudo dpkg -i logmsg-1.0_all.deb

text

Arch Linux:

sudo pacman -U logmsg-1.0-1-any.pkg.tar.zst

text

#### Usage

logmsg info "Information message"
logmsg warn "Warning message"
logmsg error "Error message"
logmsg success "Success message"
logmsg custom "LEVEL" "$(tput setaf 214)" "Custom color message"

text
- Aliases are automatically available in any new Bash or Fish shell session.
- You can specify any color supported by your terminal using tput.

#### Package Details
- Installs to: `/usr/bin/logmsg`
- Bash alias: `/etc/profile.d/logmsg-alias.sh`
- Fish alias: `/etc/fish/conf.d/logmsg.fish`

#### License
MIT

---

[de]
### Universeller Farblogger für Shell-Skripte

**logmsg** ist ein farbiges Logging-Utility-Skript für Bash und Fish, mit Integration zur Systemd-Journald (`systemd-cat`) und automatisierter Alias-Einrichtung bei Paketinstallation.

#### Funktionen
- Farbige, übersichtliche Log-Ausgabe (ANSI und tput 256-Farben)
- System-Logging via Journald
- Vordefinierte Log-Level: info, warn, error, success, und custom
- Systemweite Alias-Einrichtung für Bash und Fish per Paketinstallation

#### Installation

Debian/Ubuntu:

sudo dpkg -i logmsg-1.0_all.deb

text

Arch Linux:

sudo pacman -U logmsg-1.0-1-any.pkg.tar.zst

text

#### Verwendung

logmsg info "Informationsnachricht"
logmsg warn "Warnung"
logmsg error "Fehlermeldung"
logmsg success "Erfolgsmeldung"
logmsg custom "LEVEL" "$(tput setaf 214)" "Individuelle Farbmeldung"

text
- Aliases sind automatisch in neuen Bash- oder Fish-Shell-Sitzungen verfügbar.
- Sie können alle durch Ihr Terminal unterstützten Farben mit tput angeben.

#### Paketdetails
- Installiert unter: `/usr/bin/logmsg`
- Bash-Alias: `/etc/profile.d/logmsg-alias.sh`
- Fish-Alias: `/etc/fish/conf.d/logmsg.fish`

#### Lizenz
MIT