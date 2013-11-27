NAME             = amos
VERSION          = 3.1.0
RELEASE          = 1
PKG_ROOT         = /opt/amos

SRC_SUBDIR       = amos

AMOS_NAME        = $(NAME)
AMOS_VERSION     = $(VERSION)
AMOS_PKG_SUFFIX  = tgz
AMOS_SOURCE_PKG  = $(AMOS_NAME)-$(AMOS_VERSION).$(AMOS_PKG_SUFFIX)
AMOS_SOURCE_DIR  = $(AMOS_SOURCE_PKG:%.$(AMOS_PKG_SUFFIX)=%)

TGZ_PKGS         = $(AMOS_SOURCE_PKG)
