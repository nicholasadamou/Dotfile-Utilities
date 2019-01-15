#!/bin/bash

# shellcheck source=/dev/null

source /dev/stdin <<<"$(curl -s "https://raw.githubusercontent.com/nicholasadamou/utilities/master/utilities.sh")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# go functions

is_go_installed() {

    if ! cmd_exists "go"; then
        return 1
    fi

}

go_install() {

    local package="$1"
    local PACKAGE_READABLE_NAME

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    PACKAGE_READABLE_NAME="$(
        basename "$package"
    )"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `go` is installed.

    is_go_installed || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -d "$GOBIN/$PACKAGE_READABLE_NAME" ] && [ ! -f "$GOBIN/$PACKAGE_READABLE_NAME" ]; then
        execute \
            "go get $package" \
            "go install ($PACKAGE_READABLE_NAME)"
    else
        print_success "($PACKAGE_READABLE_NAME) is already installed"
    fi

}
