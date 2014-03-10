NAME               = mummer
VERSION            = 3.23
RELEASE            = 1
PKGROOT            = /opt/mummer
RPM.EXTRAS         = AutoReq:No

SRC_SUBDIR         = mummer

MUMMER_NAME        = $(NAME)
MUMMER_VERSION     = $(VERSION)
MUMMER_PKG_SUFFIX  = tar.gz
MUMMER_SOURCE_PKG  = $(MUMMER_NAME)-$(MUMMER_VERSION).$(MUMMER_PKG_SUFFIX)
MUMMER_SOURCE_DIR  = $(MUMMER_SOURCE_PKG:%.$(MUMMER_PKG_SUFFIX)=%)

TAR_GZ_PKGS        = $(MUMMER_SOURCE_PKG)
