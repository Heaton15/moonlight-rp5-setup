.PHONY: help
help:
	@echo "Available targets:"
	@echo "    clean     - Delete cloned / temporary files"
	@echo "    install   - Install moonlight-qt"
	@echo "    reinstall - Clean the repo and reinstall moonlight-qt on the latest release"

clean:
	rm -rf moonlight-qt moonlight.service
	pushd xone && sudo ./uninstall.sh && popd

install:
	bash ./setup.sh
	bash ./xone.sh

reinstall: clean install
