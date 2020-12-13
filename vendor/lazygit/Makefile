# Package details
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

ifeq ($(ARCH), amd64)
  ARCH=x86_64
endif

export VENDOR ?= jesseduffield
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
