include ../../tasks/Makefile.vendor_includes

ifeq ($(ARCH), amd64)
	ARCH=x86_64
endif

export VENDOR = getantibody
export PACKAGE_NAME = antibody
export PACKAGE_REPO_NAME = antibody
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/antibody_$(OS)_$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

