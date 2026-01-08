#/usr/bin/bash

sudo cp -r $VULKAN_SDK/include/vulkan/ /usr/local/include/
sudo cp -r $VULKAN_SDK/include/vk_video/ /usr/local/include/
sudo cp -P $VULKAN_SDK/lib/libvulkan.so* /usr/local/lib/
sudo cp $VULKAN_SDK/lib/libVkLayer_*.so /usr/local/lib/
sudo mkdir -p /usr/local/share/vulkan/explicit_layer.d
sudo cp $VULKAN_SDK/share/vulkan/explicit_layer.d/VkLayer_*.json /usr/local/share/vulkan/explicit_layer.d
sudo ldconfig
