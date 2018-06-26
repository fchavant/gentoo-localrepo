EAPI=5

PYTHON_COMPAT=( python2_7 python3_4 python3_5 )

inherit distutils-r1 eutils

MY_P="${P/_/-}"

DESCRIPTION="A cli based TOTP app"
HOMEPAGE="https://github.com/tadeck/onetimepass/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/${MY_P}"

python_install_all() {
	distutils-r1_python_install_all
}
