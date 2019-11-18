FROM golang:1.13-alpine
MAINTAINER Totoval <totoval@tobyan.com> (https://totoval.com)

LABEL "com.github.actions.name"="Go Release Binary"
LABEL "com.github.actions.description"="Automate publishing Totoval build artifacts for GitHub releases"
LABEL "com.github.actions.icon"="cpu"
LABEL "com.github.actions.color"="blue"

LABEL "name"="Automate publishing Totoval build artifacts for GitHub releases through GitHub Actions"
LABEL "version"="1.0.0"
LABEL "repository"="http://github.com/totoval/go-release.action"
LABEL "homepage"="https://totoval.com"

LABEL "maintainer"="Totoval <totoval@tobyan.com> (https://totoval.com)"

RUN apk add --no-cache curl jq git build-base

ENV GO111MODULE on

ADD entrypoint.sh /entrypoint.sh
ADD build.sh /build.sh
ENTRYPOINT ["/entrypoint.sh"]
