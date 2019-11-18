#!/bin/sh

set -eux

GO111MODULE=on

PROJECT_ROOT="/go/src/github.com/${GITHUB_REPOSITORY}"

mkdir -p $PROJECT_ROOT
rmdir $PROJECT_ROOT
ln -s $GITHUB_WORKSPACE $PROJECT_ROOT
cd $PROJECT_ROOT
go mod download
go build -o ./builds/server ./main.go
go build -o ./builds/artisan ./artisan.go
