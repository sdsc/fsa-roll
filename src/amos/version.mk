NAME           = sdsc-amos
VERSION        = 3.1.0
RELEASE        = 3
PKGROOT        = /opt/amos

SRC_SUBDIR     = amos

SOURCE_NAME    = amos
SOURCE_SUFFIX  = tgz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
