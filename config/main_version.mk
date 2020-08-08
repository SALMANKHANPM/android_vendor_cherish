# Set all versions
CHERISH_BUILD_TYPE ?= UNOFFICIAL

CHERISH_DATE_YEAR := $(shell date -u +%Y)
CHERISH_DATE_MONTH := $(shell date -u +%m)
CHERISH_DATE_DAY := $(shell date -u +%d)
CHERISH_DATE_HOUR := $(shell date -u +%H)
CHERISH_DATE_MINUTE := $(shell date -u +%M)
CHERISH_BUILD_DATE_UTC := $(shell date -d '$(CHERISH_DATE_YEAR)-$(CHERISH_DATE_MONTH)-$(CHERISH_DATE_DAY) $(CHERISH_DATE_HOUR):$(CHERISH_DATE_MINUTE) UTC' +%s)
CHERISH_BUILD_DATE := $(CHERISH_DATE_YEAR)$(CHERISH_DATE_MONTH)$(CHERISH_DATE_DAY)-$(CHERISH_DATE_HOUR)$(CHERISH_DATE_MINUTE)

CHERISH_PLATFORM_VERSION := 11.0

CHERISHVERSION := 2.2.8

CHERISH_DATE_CODE := $(CHERISH_DATE_HOUR)$(CHERISH_DATE_MINUTE)

TARGET_PRODUCT_SHORT := $(subst cherish_,,$(CHERISH_BUILD))

CHERISH_VERSION := Cherish-OS-v$(CHERISHVERSION)-$(CHERISH_BUILD_DATE)-$(CHERISH_BUILD)-$(CHERISH_BUILD_TYPE)
ifeq ($(CHERISH_NONGAPPS), true)
CHERISH_VERSION := Cherish-OS-v$(CHERISHVERSION)-$(CHERISH_BUILD_DATE)-$(CHERISH_BUILD)-$(CHERISH_BUILD_TYPE)-Vanilla
else
CHERISH_VERSION := Cherish-OS-v$(CHERISHVERSION)-$(CHERISH_BUILD_DATE)-$(CHERISH_BUILD)-$(CHERISH_BUILD_TYPE)-GApps
endif
CHERISH_VERSION_PROP := $(PLATFORM_VERSION)

PRODUCT_GENERIC_PROPERTIES += \
    ro.cherish.version=$(CHERISHVERSION) \
    ro.cherish.version.display=$(CHERISH_VERSION) \
    ro.cherish.build_date=$(CHERISH_BUILD_DATE) \
    ro.cherish.version.prop=$(CHERISH_VERSION_PROP) \
    ro.cherish.build_date_utc=$(CHERISH_BUILD_DATE_UTC) \
    ro.cherish.build_type=$(CHERISH_BUILD_TYPE)
