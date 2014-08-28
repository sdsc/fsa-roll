NAME        = mummer
VERSION     = 3.23
RELEASE     = 2
PKGROOT     = /opt/mummer

SRC_SUBDIR  = mummer

PKG_SUFFIX  = tar.gz
SOURCE_PKG  = $(NAME)-$(VERSION).$(PKG_SUFFIX)
SOURCE_DIR  = $(SOURCE_PKG:%.$(PKG_SUFFIX)=%)

TAR_GZ_PKGS = $(SOURCE_PKG)

RPM.EXTRAS  = AutoReq:No
