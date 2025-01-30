#!/bin/sh

echo "sourcing vulkan"
export VULKAN_SDK=$HOME/vulkan/1.4.304.0/x86_64
export PATH=$VULKAN_SDK/bin:$PATH
export LD_LIBRARY_PATH=$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
