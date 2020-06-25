# Get GOPATH from the current go environment
GOPATH := $(shell go env | grep GOPATH= | sed 's/^GOPATH=\"\(.*\)\"$$/\1/')
HABAK_PATH := github.com/habak67
PROJ_PATH := $(HABAK_PATH)/ideabug1

build:
	go build $(PROJ_PATH)

test:
	go test $(PROJ_PATH)

gen-protobuf:
	# We must run protoc from top of go source so that the go code is generated in the specified go_package directory
	cd $(GOPATH)/src && \
	protoc --proto_path=$(HABAK_PATH) --go_out=. $(PROJ_PATH)/dom.proto
