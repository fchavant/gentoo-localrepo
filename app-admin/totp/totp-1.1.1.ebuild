EAPI=5

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )

inherit distutils-r1 eutils bash-completion-r1

MY_P="${P/_/-}"

DESCRIPTION="A cli based TOTP app"
HOMEPAGE="https://pypi.org/project/totp/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

IUSE="bash-completion"

RDEPEND="app-admin/pass
	x11-misc/xclip"
DEPEND="${RDEPEND}
	dev-python/onetimepass[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

python_install_all() {
	distutils-r1_python_install_all
	use bash-completion &&
			newbashcomp contrib/totp-cli-completion.bash totp
}
