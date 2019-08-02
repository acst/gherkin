MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST))) # Location of this MAKEFILE
ROOT_DIR := $(abspath $(patsubst %/,%,$(dir $(MKFILE_PATH))))

export GOBIN := $(ROOT_DIR)/.bin
export PATH := $(GOBIN):$(PATH)

protos:
	@protoc --proto_path=./messages --gogofaster_out=Mgoogle/protobuf/timestamp.proto=github.com/gogo/protobuf/types,paths=source_relative:./messages messages/*.proto

tools::
	@go install github.com/gogo/protobuf/protoc-gen-gogofaster