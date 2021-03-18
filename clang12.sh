#!/usr/bin/env bash
export KBUILD_BUILD_USER="Wahyu"
export KBUILD_BUILD_HOST="TeamXobod"
export ARCH=arm64

make O=out ARCH=arm64 aegis_defconfig

PATH="/home/wahyu/proton/bin:${PATH}" \
                            make -j$(nproc --all) O=out \
			    CROSS_COMPILE=aarch64-linux-gnu- \
                            CC=clang \
                            AR=llvm-ar \
                            AS=llvm-as \
                            NM=llvm-nm \
                            OBJCOPY=llvm-objcopy \
                            OBJDUMP=llvm-objdump \
                            OBJSIZE=llvm-size \
                            READELF=llvm-readelf \
                            STRIP=llvm-strip \
                            HOSTCC=clang \
                            HOSTCXX=clang++ \
                            HOSTAR=llvm-ar \
                            CLANG_TRIPLE=aarch64-linux-gnu- \
                            2>&1 | tee log.jancok
