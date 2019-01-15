#!/bin/bash

# shellcheck source=/dev/null

source /dev/stdin <<<"$(curl -s "https://raw.githubusercontent.com/nicholasadamou/utilities/master/utilities.sh")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# cargo functions

is_cargo_installed() {

    if ! cmd_exists "cargo"; then
        return 1
    fi

}

cargo_install() {

    local package="$1"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `cargo` is installed.

    is_cargo_installed || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -f "$HOME/.cargo/bin/$package" ]; then
        execute \
            "cargo install --quiet $package" \
            "cargo install ($package)"
    else
        print_success "($package) is already installed"
    fi

}
