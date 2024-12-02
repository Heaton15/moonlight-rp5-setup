.PHONY: help
help:
	@echo "Available targets:"
	@echo "    clean     - Delete cloned / temporary files"
	@echo "    install   - Install moonlight-qt"
	@echo "    reinstall - Clean the repo and reinstall moonlight-qt on the latest release"

clean:
	rm -rf moonlight-qt moonlight.service
install:
	bash ./setup.sh

reinstall: clean install
