pkgname=logmsg
pkgver=1.0
pkgrel=1
pkgdesc="Universal colorized logging tool for shell/systemd, with Bash and Fish aliases"
arch=('any')
url="https://github.com/aeotag/gh-colorize"
license=('MIT')
depends=()
source=("logmsg.sh")
md5sums=('SKIP')

package() {
  # Install the main script
  install -Dm755 "$srcdir/logmsg.sh" "$pkgdir/usr/bin/logmsg"
  # Bash alias (setup for all users)
  install -Dm644 <(echo "alias logmsg='/usr/bin/logmsg'") \
    "$pkgdir/etc/profile.d/logmsg-alias.sh"
  # Fish alias (setup for all users)
  install -Dm644 <(echo "alias logmsg='/usr/bin/logmsg'") \
    "$pkgdir/etc/fish/conf.d/logmsg.fish"
}
