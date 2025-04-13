#!/usr/bin/env bash
set -ex
XONE="https://github.com/dlundqvist/xone"
# Install xone for the xbox one remote
git clone $XONE
sudo apt install dkms cabextract
pushd xone && sudo ./install.sh
sudo xone-get-firmware.sh --skip-disclaimer
popd

