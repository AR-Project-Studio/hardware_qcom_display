# Gralloc module
LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk

include $(CLEAR_VARS)
LOCAL_MODULE := gralloc_headers
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-BSD legacy_not_a_contribution
LOCAL_LICENSE_CONDITIONS := by_exception_only not_allowed notice
LOCAL_EXPORT_C_INCLUDE_DIRS   := $(LOCAL_PATH)
LOCAL_EXPORT_HEADER_LIBRARY_HEADERS := libhardware_headers liblog_headers
include $(BUILD_HEADER_LIBRARY)
include $(CLEAR_VARS)

LOCAL_MODULE                  := gralloc.$(TARGET_BOARD_PLATFORM)
LOCAL_LICENSE_KINDS           := SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-BSD legacy_not_a_contribution
LOCAL_LICENSE_CONDITIONS      := by_exception_only not_allowed notice
LOCAL_MODULE_RELATIVE_PATH    := hw
LOCAL_PROPRIETARY_MODULE      := true
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := $(common_includes) \
                                 $(kernel_includes)

LOCAL_HEADER_LIBRARIES        := libhardware_headers
LOCAL_EXPORT_HEADER_LIBRARY_HEADERS := libhardware_headers liblog_headers
LOCAL_SHARED_LIBRARIES        := $(common_libs) libqdMetaData libsync
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdgralloc\" -fPIC -Wall -std=c++11 -Werror
LOCAL_CLANG                   := true
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps) $(kernel_deps)
LOCAL_SRC_FILES               := gr_utils.cpp \
                                 gr_ion_alloc.cpp \
                                 gr_adreno_info.cpp \
                                 gr_allocator.cpp \
                                 gr_buf_mgr.cpp \
                                 gr_device_impl.cpp
include $(BUILD_SHARED_LIBRARY)
