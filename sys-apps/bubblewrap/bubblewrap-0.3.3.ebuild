# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 linux-info

DESCRIPTION="Unprivileged sandboxing tool, namespaces-powered chroot-like solution"
HOMEPAGE="https://github.com/projectatomic/bubblewrap"
SRC_URI="https://github.com/projectatomic/${PN}/releases/download/v${PV}/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sys-libs/libseccomp
	sys-libs/libcap
"
DEPEND="${DEPEND}
	app-text/docbook-xml-dtd:4.3
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
	virtual/pkgconfig
"

# tests require root priviledge
RESTRICT="test"

pkg_setup() {
	if [[ ${MERGE_TYPE} != buildonly ]]; then
		CONFIG_CHECK="~UTS_NS ~IPC_NS ~USER_NS ~PID_NS ~NET_NS"
		linux-info_pkg_setup
	fi
}

src_configure() {
	econf \
		"--enable-man" \
		"--with-bash-completion-dir=$(get_bashcompdir)"
}
