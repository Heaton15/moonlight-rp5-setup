#!/usr/bin/env bash
set -ex
XONE="https://github.com/medusalix/xone"
# Install xone for the xbox one remote
git clone $XONE
sudo apt install dkms
pushd xone && sudo ./install.sh
sudo xone-get-firmware.sh --skip-disclaimer
popd

