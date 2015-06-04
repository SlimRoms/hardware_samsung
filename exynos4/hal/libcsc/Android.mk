LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_USE_EXYNOS_OMX), true)
OMX_NAME := exynos
else
OMX_NAME := sec
endif

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    csc_helper.c

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)

LOCAL_C_INCLUDES := \
    system/core/include \
    $(LOCAL_PATH)/../include \
    $(LOCAL_PATH)/../../../exynos/multimedia/openmax/include/khronos \
    $(LOCAL_PATH)/../../../exynos/multimedia/openmax/include/$(OMX_NAME)

LOCAL_CFLAGS := \
    -DUSE_SAMSUNG_COLORFORMAT 
ifeq ($(BOARD_USE_EXYNOS_OMX), true)
LOCAL_CFLAGS += -DEXYNOS_OMX
endif 

LOCAL_MODULE := libcsc_helper
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := liblog

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	csc.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../libexynosutils \
	$(LOCAL_PATH)/../../../exynos/multimedia/openmax/include/khronos \
	$(LOCAL_PATH)/../../../exynos/multimedia/openmax/include/$(OMX_NAME)


LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)

LOCAL_CFLAGS :=

LOCAL_MODULE := libcsc

LOCAL_PRELINK_MODULE := false

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libswconverter
LOCAL_WHOLE_STATIC_LIBRARIES := libcsc_helper
LOCAL_SHARED_LIBRARIES := liblog libexynosutils

LOCAL_CFLAGS += -DUSE_SAMSUNG_COLORFORMAT

ifeq ($(TARGET_BOARD_PLATFORM), exynos4)
LOCAL_SRC_FILES += hwconverter_wrapper.cpp
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../libhwconverter \
LOCAL_CFLAGS += -DUSE_FIMC
LOCAL_SHARED_LIBRARIES += libfimc libhwconverter
endif 

ifeq ($(TARGET_BOARD_PLATFORM), exynos5)
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../include
LOCAL_CFLAGS += -DENABLE_GSCALER -DENABLE_G2D
LOCAL_SHARED_LIBRARIES += libexynosgscaler
endif

LOCAL_CFLAGS += -DUSE_ION
LOCAL_SHARED_LIBRARIES += libsecion

ifeq ($(BOARD_USE_EXYNOS_OMX), true)
LOCAL_CFLAGS += -DEXYNOS_OMX
endif

include $(BUILD_SHARED_LIBRARY)
