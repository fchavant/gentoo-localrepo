EAPI="5"

inherit eutils autotools

DESCRIPTION="A breadth-first version of the UNIX find command"
HOMEPAGE="https://github.com/tavianator/bfs"
SRC_URI="https://github.com/tavianator/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
    make DESTDIR="${D}" install || die
}
