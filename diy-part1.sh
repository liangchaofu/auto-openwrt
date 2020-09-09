#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

git clone https://github.com/liangchaofu/packages.git package/lcf

cd tools
mkdir lcf
git clone https://github.com/liangchaofu/upx.git tools/lcf
mv tools/lcf/.git tools
rmdir lcf
git reset --hard HEAD
git clone https://github.com/liangchaofu/upx.git tools

sed -i '$a tools-y += ucl upx' tools/Makefile
sed -i '$a $(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile
