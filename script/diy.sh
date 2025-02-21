#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
SOURCE_PATH=$1
echo "源码所在路径: $SOURCE_PATH"
echo '修改网关地址'
cat "$SOURCE_PATH/package/base-files/files/bin/config_generate"
sed -i 's/192.168.1.1/192.168.2.1/g' "$SOURCE_PATH/package/base-files/files/bin/config_generate"

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" "$SOURCE_PATH/package/base-files/files/bin/config_generate"

echo '修改默认主题为argon'
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' "$SOURCE_PATH/feeds/luci/modules/luci-base/root/etc/config/luci"
sed -i 's/option mediaurlbase \/luci-static\/bootstrap/option mediaurlbase \"\/luci-static\/argon\"/g' "$SOURCE_PATH/feeds/luci/modules/luci-base/root/etc/config/luci"

# wechatpush
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush "${SOURCE_PATH}/package/new/luci-app-wechatpush"
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki "${SOURCE_PATH}/package/new/openWrt-nikki"
git clone --depth 1 https://github.com/vernesong/OpenClash "${SOURCE_PATH}/package/new/openWrt-OpenClash"