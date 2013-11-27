NAME            = fsa
VERSION         = 1.15.7
RELEASE         = 1
PKG_ROOT        = /opt/fsa

SRC_SUBDIR      = fsa

FSA_NAME        = $(NAME)
FSA_VERSION     = $(VERSION)
FSA_PKG_SUFFIX  = tgz
FSA_SOURCE_PKG  = $(FSA_NAME)-$(FSA_VERSION).$(FSA_PKG_SUFFIX)
FSA_SOURCE_DIR  = $(FSA_SOURCE_PKG:%.$(FSA_PKG_SUFFIX)=%)

TGZ_PKGS         = $(FSA_SOURCE_PKG)
