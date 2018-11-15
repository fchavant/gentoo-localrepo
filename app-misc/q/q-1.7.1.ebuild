EAPI=5

PYTHON_COMPAT=( python2_7 )

MY_P="${P/_/-}"

DESCRIPTION="Run SQL directly on CSV or TSV files"
HOMEPAGE="https://pypi.org/project/totp/"
SRC_URI="https://github.com/harelba/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/${MY_P}"

python_install_all() {
	dobin bin/q
}
