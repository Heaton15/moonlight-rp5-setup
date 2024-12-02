#!/usr/bin/env bash

set -ex

# Setups up the moonlight-qt repo for a RP5 
# This is the user moonlight service file to auto start moonlight on power on 
# ~/.config/systemd/user/moonlight.service


MOONLIGHT_QT="https://github.com/moonlight-stream/moonlight-qt.git"
REQS=(libegl1-mesa-dev libgl1-mesa-dev libopus-dev libsdl2-dev libsdl2-ttf-dev libssl-dev libavcodec-dev libavformat-dev libswscale-dev libva-dev libvdpau-dev libxkbcommon-dev wayland-protocols libdrm-dev)
QT_DEPS=(qtbase5-dev qt5-qmake qtdeclarative5-dev qtquickcontrols2-5-dev qml-module-qtquick-controls2 qml-module-qtquick-layouts qml-module-qtquick-window2 qml-module-qtquick2 qtwayland5)
QMAKE=qmake
VERSION=release

INSTALL_LOC="$HOME/.local/bin"

new_dir() {
    # If the directory does not exist, create it 
    if [[ ! -d $1 ]]; then
        mkdir -p $1
    fi
}

new_file() {
    # if the file does not exist, create it  
    if [[ ! -f $1 ]]; then
        touch $1
    fi
}



if [[ -n "${QT6}" ]]; then
    QMAKE=qmake6
    QT_DEPS=(qt6-base-dev qt6-declarative-dev libqt6svg6-dev qml6-module-qtquick-controls qml6-module-qtquick-templates qml6-module-qtquick-layouts qml6-module-qtqml-workerscript qml6-module-qtquick-window qml6-module-qtquick)
fi

if [[ -n "${DEBUG}" ]]; then
    VERSION=debug
fi

CWD=$(pwd)

# Install base dependencies 
for dep in "${REQS[@]}"; do
    sudo apt install $dep
done

# Install QT5 | QT6 dependencies
for dep in "${QT_DEPS[@]}"; do
    sudo apt install $dep
done

# Setup moonlight repo
pushd moonlight-qt/
git submodule update --init --recursive
$QMAKE moonlight-qt.pro
make $VERSION 

#if [[ ! -d "${INSTALL_LOC}" ]]; then
#    mkdir -p "${INSTALL_LOC}"
#fi
#if [[ ! -f "$HOME/.bashrc" ]]; then
#    touch $HOME/.bashrc
#fi

new_dir "${INSTALL_LOC}"
new_file "$HOME/.bashrc"

# If we don't see moonlight-qt, update bashrc to point here
if ! echo $PATH | tr ':' '\n' | grep -q "moonlight-qt"; then
    echo "export PATH=${CWD}/moonlight-qt/app:\$PATH" >> $HOME/.bashrc
fi

# We need to create the moonlight.service file that systemd
# can use so that we always boot into moonlight off the bat
echo -e "[Unit]
Description=moonlight service\n
[Service]
Type=simple
ExecStart=${CWD}/moonlight-qt/app/moonlight\n
[Install]
WantedBy=default.target" > moonlight.service

# Move the moonlight.service to the user config
new_dir "$HOME/.config/systemd/user" && cp moonlight.service "$HOME/.config/systemd/user"
