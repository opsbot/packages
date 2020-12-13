export PACKAGE_NAME ?= migrate

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= golang-migrate
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME).$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

define download_migrate
	[ -n "$(TMP)" ] && [ -n "$(PACKAGE_NAME)" ] && rm -rf "$(TMP)/$(PACKAGE_NAME)"
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o - $(DOWNLOAD_URL) | tar -zx -C $(TMP)/$(PACKAGE_NAME)
	find $(TMP)/$(PACKAGE_NAME) -type f -name $(PACKAGE_NAME).$(OS)-$(ARCH) | xargs -I {} cp -f {} $(INSTALL_PATH)/$(PACKAGE_NAME)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)
	[ -n "$(TMP)" ] && [ -n "$(PACKAGE_NAME)" ] && rm -rf "$(TMP)/$(PACKAGE_NAME)"
endef

install:
	$(call download_migrate)

test:
	$(PACKAGE_EXE) version

