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


grab() {
    realpath "$1" | tr -d "\n" | xclip -selection clipboard
}

add_to_path() {
    BIN=$(realpath "$1" | tr -d "\n")
    export PATH=${BIN}${PATH:+:${PATH}}
    echo "${BIN} added to \$PATH"
}

add_to_pypath() {
    BIN=$(realpath "$1" | tr -d "\n")
    export PYTHONPATH=${BIN}${PYTHONPATH:+:${PYTHONPATH}}
    echo "${BIN} added to \$PYTHONPATH"
}

wsp_compress() {
    echo "Compressing $1 for WhatsApp, output video will be $2 ..."
    ffmpeg -i $1 -vcodec libx264 -acodec aac $2
    echo "Done!"
}

split_video() {
    VIDEO="$1"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}

    VIDEO_LENGTH="$(ffprobe -i $VIDEO -show_entries format=duration -v quiet -of csv='p=0')"
    SPLIT_SECONDS=$(($VIDEO_LENGTH / 2))
    SPLIT="$(date -d@"${SPLIT_SECONDS}" -u +%H:%M:%S)"

    echo "Splitting in half $VIDEO..."
    ffmpeg -i $1 -t ${SPLIT} -c copy "${FILENAME}"_part_1.mp4 \
        -ss ${SPLIT} -c copy "${FILENAME}"_part_2.mp4
    echo "Done!"
}
