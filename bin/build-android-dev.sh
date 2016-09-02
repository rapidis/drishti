#!/bin/bash

. ${DRISHTISDK}/bin/build-dev.sh

#TOOLCHAIN=android-ndk-r10e-api-16-armeabi-v7a-neon-clang-35-hid

TOOLCHAIN=android-ndk-r10e-api-19-armeabi-v7a-neon

EXTRA_ARGS=""
if [ $# -ge 1 ]; then
    EXTRA_ARGS="--clear"
fi

[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_SDK_ROOT
[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_HOME
echo $ANDROID_SDK_ROOT

DRISHTI_BUILD_QT=ON
DRISHTI_BUILD_OGLES_GPGPU=ON

rename_tab drishti $TOOLCHAIN

COMMAND=(
    "--verbose "
    "--fwd ANDROID=TRUE "
    "${DRISHTI_BUILD_ARGS[*]} "
    "DRISHTI_BUILD_QT=${DRISHTI_BUILD_QT} "
    "DRISHTI_BUILD_OGLES_GPGPU=${DRISHTI_BUILD_OGLES_GPGPU} "
    "--config Release "
    "--install "
    "--jobs 8 "
    "${EXTRA_ARGS} "
)

eval build.py --toolchain ${TOOLCHAIN} ${COMMAND[*]}
