
# exit codes
readonly E_USER_TERMINATED=2
readonly E_INVALID_USE=3
readonly E_ENVIRONMENT_FAILED=4

readonly E_INSTALL_FAILED=5

# functions
fail() {
    echo $1
    exit $2
}

echo_bold {
    echo $1
}


