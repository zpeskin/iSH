# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="c4baf7d8777e5bd59be893e41a0e0282"

inherit desktop multilib xdg-utils

DESCRIPTION="Librewolf Web Browser"
HOMEPAGE="https://librewolf-community.gitlab.io"
RESTRICT="strip mirror"
SRC_URI="https://gitlab.com/${PN}-community/browser/linux/uploads/${COMMIT}/${P//r/}-x86_64.pkg.tar.xz -> ${P}.tar.xz"


LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+ffmpeg +pulseaudio selinux startup-notification"

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}
	dev-libs/atk
	>=sys-apps/dbus-0.60
	>=dev-libs/dbus-glib-0.72
	>=dev-libs/glib-2.26:2
	media-libs/fontconfig
	>=media-libs/freetype-2.4.10
	>=x11-libs/cairo-1.10[X]
	x11-libs/gdk-pixbuf
	>=x11-libs/gtk+-2.18:2
	>=x11-libs/gtk+-3.4.0:3
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXt
	>=x11-libs/pango-1.22.0
	virtual/freedesktop-icon-theme
	pulseaudio? ( !<media-sound/apulse-0.1.9
		|| ( media-sound/pulseaudio media-sound/apulse ) )
	ffmpeg? ( media-video/ffmpeg )
	selinux? ( sec-policy/selinux-mozilla )
"

S="${WORKDIR}/usr"

src_install() {
	dodir /usr/$(get_libdir)
	cp -a "${S}/lib/${PN}" "${D}"/usr/$(get_libdir)
	domenu "${S}/share/applications/${PN}.desktop"
	for SIZE in 16 32 48 64 128 192
	do
		doicon --size "${SIZE}" "${S}/share/icons/hicolor/${SIZE}x${SIZE}/apps/${PN}.png"
	done
	dobin "${S}/bin/${PN}"
	dodir "/usr/share/icons/hicolor/symbolic/apps"
	insopts -m 0644
	insinto "/usr/share/icons/hicolor/symbolic/apps"
	doins "${S}/share/icons/hicolor/symbolic/apps/${PN}-symbolic.png"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
