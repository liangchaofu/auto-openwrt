#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

git clone https://github.com/liangchaofu/packages.git package/lcf
git clone https://github.com/jerrykuku/luci-theme-argon.git package/lcf
git clone https://github.com/liangchaofu/golang.git tools
git clone https://github.com/liangchaofu/golang.git feeds/packages/lang

rm -rf openwrt/feeds/packages/net/shadowsocks-libev
rm -rf openwrt/feeds/luci/applications/luci-app-shadowsocks-libev

sed -i '$a tools-y += ucl upx' tools/Makefile
sed -i '$a $(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile
