#!/usr/bin/env bash

#
# Change the toolchain from aarch64 to armv7 to build 32b kernel and fs
#
# ${2} - uboot building directory
# ${3} - top directory

echo ${2}
echo ${3}

rm -rf board/nxp/ls1012ardb/temp
mkdir board/nxp/ls1012ardb/temp

cp output/images/* board/nxp/ls1012ardb/temp/

make clean
rm .config

cp board/nxp/ls1012ardb/ls1012ardb-32b_linux_fs_defconfig configs/ls1012ardb-32b_linux_fs_defconfig

make ls1012ardb-32b_linux_fs_defconfig

rm -f configs/ls1012ardb-32b_linux_fs_defconfig

make
