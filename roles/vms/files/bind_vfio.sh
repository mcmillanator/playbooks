#!/bin/bash

#credit https://github.com/bryansteiner/gpu-passthrough-tutorial#part1

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

sudo systemctl stop gdm

## Unload Nvidia drivers
modprobe -r nvidia_drm
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
modprobe -r nvidia

## Load vfio
modprobe vfio
modprobe vfio_iommu_type1
modprobe vfio_pci

## Unbind gpu from nvidia and bind to vfio
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO
virsh nodedev-detach $VIRSH_GPU_USB
virsh nodedev-detach $VIRSH_GPU_SERIAL

systemctl start gdm
