NAME           = sdsc-amos
VERSION        = 3.1.0
RELEASE        = 5
PKGROOT        = /opt/amos
override ROLLCOMPILER   = pgi
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

SRC_SUBDIR     = amos

SOURCE_NAME    = amos
SOURCE_SUFFIX  = tgz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
