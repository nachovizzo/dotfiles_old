get_remote() {
    git remote -vv | tail -n1 | awk '{print $2}' | tr -d '\n' | xcopy
}

# Please turn this into a python script
gdb_test() {
    TEST_CASE="$1"
    EXTRA_ARGS="${@:2}"
    TEST_COMMAND=" $(ctest -V -N -R ${TEST_CASE} | grep -oP "(Test command:\s)\K(.*$)+" | tr -d '"')"
    CWD="$(ctest -R ${TEST_CASE} --show-only=json-v1 | jq '.tests[0].properties[0].value')"
    eval "gdb -cd="${CWD}" -ex=r --args ${TEST_COMMAND} ${EXTRA_ARGS}"
}

