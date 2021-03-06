release:
	@echo "** Releasing version $(VERSION)..."
	@echo "** Building..."
	@$(MAKE) build
	@echo "** Tagging and pushing..."
	@git tag -a $(VERSION)
	@git push --tags
.PHONY: release

build:
	@gox -osarch="darwin/386 darwin/amd64 linux/386 linux/amd64 openbsd/386 openbsd/amd64 window/386 windows/amd64" -output="dnote-{{.OS}}-{{.Arch}}" ./...
.PHONY: build

clean:
	@git clean -f
.PHONY: clean

