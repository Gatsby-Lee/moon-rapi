#!/bin/bash

TARGET_DEVICE="/dev/sda"

check_target_device() {
   read -p "Confirm the target device is ${TARGET_DEVICE} ? (y/N) " yn
    case $yn in
        y ) echo ok, we will proceed;;
        n ) exit;;
	* ) exit 1;;
    esac
}

setup_pkg_dep() {
    echo -e "\n=====> Install pkg depen"
    sudo apt-get update
    sudo apt-get install -y curl bzip2 btrfs-progs gawk gpg udev wget jq
}

setup_flatcar_install_script() {
    echo -e "\n=====> Install Flatcar Install Script."
    curl -LO https://raw.githubusercontent.com/flatcar/init/flatcar-master/bin/flatcar-install
    chmod +x flatcar-install
}

setup_flatcar() {
    # IMPORTANT: SSD has to be unmounted. ( no mounting point )

    # -d DEVICE   Install Flatcar Container Linux to the given device.
    # -C CHANNEL  Release channel to use
    # -B BOARD    Flatcar Container Linux Board to use
    # -o OEM      OEM type to install (e.g. ami), using flatcar_production_<OEM>_image.bin.bz2
    # -i IGNITION Insert an Ignition config to be executed on boot.
    echo -e "\n=====> Install Flatcar to ${TARGET_DEVICE}"
    sudo ./flatcar-install -d ${TARGET_DEVICE} -C stable -B arm64-usr -o '' -i config.json
}

setup_uefi_firmware() {
    # IMPORTANT: the devince has to be changed

    local tmp_mount_path="/tmp/efipartition"
    if [ ! -d ${tmp_mount_path} ]; then
        echo -e "\n=====> Creating tmp mounting path: ${tmp_mount_path}"
        mkdir ${tmp_mount_path}
    fi

    efipartition=$(lsblk ${TARGET_DEVICE} -oLABEL,PATH | awk '$1 == "EFI-SYSTEM" {print $2}')
    echo -e "\n=====> Mounting ${efipartition} to ${tmp_mount_path}"
    sudo mount ${efipartition} ${tmp_mount_path}
    echo -e "\n===== Moving to ${tmp_mount_path}"
    pushd ${tmp_mount_path}

    version=$(curl --silent "https://api.github.com/repos/pftf/RPi4/releases/latest" | jq -r .tag_name)
    echo -e "=====> Downloading RPi4_UEFI_Firmware_${version}.zip"
    sudo curl -LO https://github.com/pftf/RPi4/releases/download/${version}/RPi4_UEFI_Firmware_${version}.zip
    sudo unzip RPi4_UEFI_Firmware_${version}.zip
    sudo rm RPi4_UEFI_Firmware_${version}.zip
    echo -e "\n=====> Coming back the previous directory."
    popd
    echo -e "\n=====> Unmounting ${efipartition}"
    sudo umount ${tmp_mount_path}
}

if [ "$#" -ne 1 ]; then
    echo -e "\nPlease provide the target device name"
    echo -e "You can check by using lsblk."
    echo -e "./setup_flatcar_pi4_ssd.sh <target-device. i.e. /dev/sda>"
    exit 1
fi

TARGET_DEVICE=$1

check_target_device
setup_pkg_dep
setup_flatcar_install_script
setup_flatcar
setup_uefi_firmware

