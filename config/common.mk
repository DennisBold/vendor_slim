PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/slim/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/slim/prebuilt/common/bin/50-slim.sh:system/addon.d/50-slim.sh

# SLIM-specific init file
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/init.local.rc:root/init.slim.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/slim/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/slim/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/slim/prebuilt/common/etc/init.d/01slim:system/etc/init.d/01slim \
    vendor/slim/prebuilt/common/etc/init.d/02userinit:system/etc/init.d/02userinit \
    vendor/slim/prebuilt/common/etc/init.d/03tweaks:system/etc/init.d/03tweaks \
    vendor/slim/prebuilt/common/etc/init.d/04mountrw:system/etc/init.d/04mountrw \
    vendor/slim/prebuilt/common/etc/init_trigger.disabled:system/etc/init_trigger.enabled \
    vendor/slim/prebuilt/common/bin/sysinit:system/bin/sysinit

PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/cron/cron.conf:system/etc/cron/cron.conf \
    vendor/slim/prebuilt/common/etc/cron/cron.hourly/00drop_caches:system/etc/cron/cron.hourly/00drop_caches \
    vendor/slim/prebuilt/common/etc/cron/cron.daily/00drop_caches:system/etc/cron/cron.daily/00drop_caches \
    vendor/slim/prebuilt/common/etc/cron/cron.weekly/00drop_caches:system/etc/cron/cron.weekly/00drop_caches \
    vendor/slim/prebuilt/common/etc/cron/cron.hourly/01clear_cache:system/etc/cron/cron.hourly/01clear_cache \
    vendor/slim/prebuilt/common/etc/cron/cron.daily/01clear_cache:system/etc/cron/cron.daily/01clear_cache \
    vendor/slim/prebuilt/common/etc/cron/cron.weekly/01clear_cache:system/etc/cron/cron.weekly/01clear_cache 

# Workaround for NovaLauncher zipalign fails
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/app/NovaLauncher.apk:system/app/NovaLauncher.apk

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Required packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    SpareParts \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    LiveWallpapersPicker \
    PhaseBeam

# Extra Optional packages
PRODUCT_PACKAGES += \
    DashClock \
    SlimCenter \
    LatinIME 
#    SlimIRC
#    SlimFileManager

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

PRODUCT_PACKAGE_OVERLAYS += vendor/slim/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/slim/overlay/common

# T-Mobile theme engine
include vendor/slim/config/themes_common.mk

# Versioning System
# Reopen for 6.3
PRODUCT_VERSION_MAJOR = 4.2.2
PRODUCT_VERSION_MINOR = build
PRODUCT_VERSION_MAINTENANCE = 6.3

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=$(BUILD_ID)

PRODUCT_PROPERTY_OVERRIDES += \
    slim.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)

ifdef SLIM_EXP
    SLIM_VERSION := SlimBean-OpenPDroid-DennisBold-EXP-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
    SLIM_MOD_VERSION := SlimBean-OpenPDroid-DennisBold-EXP-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
    PLATFORM_VERSION_CODENAME := EXP
else
    ifdef SLIM_DISPLAY
        SLIM_VERSION := SlimBean-OpenPDroid-DennisBold-DISPLIBS-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
        SLIM_MOD_VERSION := SlimBean-OpenPDroid-DennisBold-DISPLIBS-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
        PLATFORM_VERSION_CODENAME := DISP
    endif
endif
ifdef SLIM_REL
        SLIM_VERSION := SlimBean-OpenPDroid-DennisBold-REL-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
        SLIM_MOD_VERSION := SlimBean-OpenPDroid-DennisBold-REL-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
        PLATFORM_VERSION_CODENAME := RELEASE
else
    ifdef SLIM_NEXP
        SLIM_VERSION := SlimBean-OpenPDroid-DennisBold-$(PRODUCT_VERSION_MAINTENANCE)-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
        SLIM_MOD_VERSION := SlimBean-OpenPDroid-DennisBold-$(PRODUCT_VERSION_MAINTENANCE)-$(shell date +"%A%d%B%Y-%I%M%p-%Z")
        PLATFORM_VERSION_CODENAME := EXP
    endif

endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.slim.version=$(SLIM_VERSION) \
    ro.modversion=$(SLIM_MOD_VERSION)
