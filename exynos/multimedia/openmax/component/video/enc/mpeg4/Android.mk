LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	Exynos_OMX_Mpeg4enc.c \
	library_register.c

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libOMX.Exynos.MPEG4.Encoder
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/omx

LOCAL_CFLAGS :=

ifeq ($(BOARD_USE_METADATABUFFERTYPE), true)
LOCAL_CFLAGS += -DUSE_METADATABUFFERTYPE
endif

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libExynosOMX_Venc libExynosOMX_OSAL libExynosOMX_Basecomponent \
	libswconverter libsecmfcapi
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils liblog libui \
	libExynosOMX_Resourcemanager libcsc libexynosv4l2 libsecion \
	libhardware

LOCAL_C_INCLUDES := $(EXYNOS_OMX_INC)/khronos \
	$(EXYNOS_OMX_INC)/exynos \
	$(EXYNOS_OMX_TOP)/osal \
	$(EXYNOS_OMX_TOP)/core \
	$(EXYNOS_OMX_COMPONENT)/common \
	$(EXYNOS_OMX_COMPONENT)/video/enc \
	hardware/samsung/exynos4/hal/include \
	hardware/samsung/exynos4/hal/libcsc \
	hardware/samsung/exynos/multimedia/codecs/video/exynos4/mfc_v4l2/include

include $(BUILD_SHARED_LIBRARY)
