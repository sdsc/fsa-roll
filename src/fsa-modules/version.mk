NAME        = fsa-modules
RELEASE     = 2
PKGROOT     = /opt/modulefiles/applications/fsa

VERSION_SRC = $(REDHAT.ROOT)/src/fsa/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
