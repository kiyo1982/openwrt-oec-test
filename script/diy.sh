#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
source_dir=$1
echo "源码所在路径: "$source_dir
echo '修改网关地址'
cat "$source_dir/package/base-files/files/bin/config_generate"
sed -i 's/192.168.1.1/192.168.2.1/g' "$source_dir/package/base-files/files/bin/config_generate"

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" "$source_dir/package/base-files/files/bin/config_generate"

echo '修改默认主题为argon'
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' "$source_dir/feeds/luci/modules/luci-base/root/etc/config/luci"
sed -i 's/option mediaurlbase \/luci-static\/bootstrap/option mediaurlbase \"\/luci-static\/argon\"/g' "$source_dir/feeds/luci/modules/luci-base/root/etc/config/luci"

# wechatpush
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush ${source_dir}/package/new/luci-app-wechatpush
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki ${source_dir}/package/new/openWrt-nikki
git clone --depth 1 https://github.com/vernesong/OpenClash ${source_dir}/package/new/openWrt-OpenClash