#!/bin/sh

set -eux


PROJECT_ROOT="/go/src/github.com/${GITHUB_REPOSITORY}"

mkdir -p $PROJECT_ROOT
rmdir $PROJECT_ROOT
ln -s $GITHUB_WORKSPACE $PROJECT_ROOT
cd $PROJECT_ROOT
go mod download

EXT=''

if [ $GOOS == 'windows' ]; then
  EXT='.exe'
fi


go build -o ./builds/server${EXT} ./main.go
go build -o ./builds/artisan${EXT} ./artisan.go