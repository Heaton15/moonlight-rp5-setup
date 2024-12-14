#!/usr/bin/env bash
set -ex
XONE="https://github.com/medusalix/xone"
# Install xone for the xbox one remote
git clone $XONE
pushd xone && sudo ./install.sh
sudo xone-getfirmware.sh --skip-disclaimer
popd

