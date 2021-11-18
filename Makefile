all: uro

uro: _build
	CGO_ENABLED=0 GO111MODULE=on go build -mod=vendor -o _build/uro cmd/uro/*.go

test-process: _build
	CGO_ENABLED=0 GO111MODULE=on go build -mod=vendor -o _build/test-process cmd/test-process/*.go

install: uro
	cp _build/uro /usr/bin/
	chmod a+x /usr/bin/uro

test:
	go test -short ./...

_build:
	mkdir -p _build

clean:
	rm -rf _build
