#!/bin/bash

# 提取 .config 中的目标设备依赖（示例）
TARGET_DEPENDS=()
if grep -q "CONFIG_TARGET_ar71xx=y" .config; then
  TARGET_DEPENDS+=("ar71xx-toolchain")  # 示例依赖
fi

# 提取软件包依赖（示例）
PACKAGE_DEPENDS=()
if grep -q "CONFIG_PACKAGE_luci=y" .config; then
  PACKAGE_DEPENDS+=("libncurses5-dev libssl-dev zlib1g-dev")  # LuCI 依赖
fi

# 合并所有依赖
ALL_DEPENDS=("${TARGET_DEPENDS[@]}" "${PACKAGE_DEPENDS[@]}")

# 去重并输出
echo "${ALL_DEPENDS[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '