#
# Copyright (C) 2018-2019 The Google Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2020 Fluid
#
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

TARGET_GAPPS_ARCH := $(TARGET_ARCH)

ifneq ($(TARGET_GAPPS_ARCH), arm)
# Recorder
ifeq ($(TARGET_INCLUDE_GOOGLE_RECORDER), true)
PRODUCT_PACKAGES += \
    RecorderPrebuilt
endif

# arcore
ifeq ($(TARGET_INCLUDE_STOCK_ARCORE),true)
PRODUCT_PACKAGES += \
    arcore
endif

# Live Wallpapers
ifeq ($(TARGET_INCLUDE_LIVE_WALLPAPERS),true)
PRODUCT_PACKAGES += \
    MicropaperPrebuilt \
    WallpapersBReel2020 \
    PixelLiveWallpaperPrebuilt \
    PixelWallpapers2020
endif

# Redesigned AOSP app replacements
ifneq ($(TARGET_INCLUDE_AOSP_REPLACEMENTS), false)
PRODUCT_PACKAGES += \
    GoogleDialer \
    GoogleContacts \
    Photos \
    PrebuiltDeskClockGoogle
endif

# Literal bloat
ifneq ($(TARGET_INCLUDE_MINIMAL_GAPPS), true)
PRODUCT_PACKAGES += \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    Chrome \
    Chrome-Stub \
    GoogleTTS \
    MarkupGoogle \
    WebViewGoogle \
    WebViewGoogle-Stub \
    DevicePersonalizationPrebuiltPixel2020 \
    GooglePrintRecommendationService \
    TurboAdapter \
    Flipendo
endif
# product/app
PRODUCT_PACKAGES += \
    CarrierMetrics \
    GoogleContactsSyncAdapter \
    DevicePolicyPrebuilt \
    DiagnosticsToolPrebuilt \
    LatinIMEGooglePrebuilt \
    LocationHistoryPrebuilt \
    Ornament \
    PrebuiltBugle \
    PrebuiltGoogleTelemetryTvp \
    SoundPickerPrebuilt \
    TrichromeLibrary \
    TrichromeLibrary-Stub \
    Tycho

# product/priv-app
PRODUCT_PACKAGES += \
    AndroidAutoStubPrebuilt \
    AndroidMigratePrebuilt \
    AppDirectedSMSService \
    CarrierLocation \
    CarrierServices \
    CarrierWifi \
    ConfigUpdater \
    DCMO \
    ConnMO \
    ConnMetrics \
    DMService \
    GoogleOneTimeInitializer \
    MaestroPrebuilt \
    OBDM_Permissions \
    PartnerSetupPrebuilt \
    Phonesky \
    SafetyHubPrebuilt \
    ScribePrebuilt \
    Showcase \
    TetheringEntitlement \
    USCCDM \
    Velvet \
    WellbeingPrebuilt \
    WfcActivation \
    obdm_stub

# system/app
PRODUCT_PACKAGES += \
    GoogleExtShared \

# system/priv-app
PRODUCT_PACKAGES += \
    TagGoogle

# system_ext/app
#PRODUCT_PACKAGES += \
#    Flipendo

# system_ext/priv-app
PRODUCT_PACKAGES += \
    CarrierSetup \
    CbrsNetworkMonitor \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GoogleServicesFramework \
    grilservice \
    RilConfigService \
    StorageManagerGoogle

# PrebuiltGmsCore
PRODUCT_PACKAGES += \
    PrebuiltGmsCoreRvc \
    PrebuiltGmsCoreRvc_AdsDynamite \
    PrebuiltGmsCoreRvc_CronetDynamite \
    PrebuiltGmsCoreRvc_DynamiteLoader \
    PrebuiltGmsCoreRvc_DynamiteModulesA \
    PrebuiltGmsCoreRvc_DynamiteModulesC \
    PrebuiltGmsCoreRvc_GoogleCertificates \
    PrebuiltGmsCoreRvc_MapsDynamite \
    PrebuiltGmsCoreRvc_MeasurementDynamite \
    AndroidPlatformServices

PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni


# System whitelist
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/app/GoogleExtShared/GoogleExtShared.apk \
    system/app/GooglePrintRecommendationService/GooglePrintRecommendationService.apk \
    system/etc/permissions/privapp-permissions-google.xml

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
   vendor/gapps/overlay/

$(call inherit-product, vendor/gapps/product/blobs/product_blobs.mk)
$(call inherit-product, vendor/gapps/system/blobs/system_blobs.mk)
$(call inherit-product, vendor/gapps/system_ext/blobs/system-ext_blobs.mk)
endif
