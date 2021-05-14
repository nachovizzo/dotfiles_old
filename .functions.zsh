function lgrep() { ll | grep $* | fzf }
function hgrep() { history | grep $* | fzf }

to_xclip() {
    echo "Copying $@ to clipboard"
    cat "$@" | xcopy
}

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
    VIDEO="$1"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}
    echo "Compressing $VIDEO for WhatsApp..."
    ffmpeg -i "${VIDEO}" -vcodec libx264 -acodec aac "${FILENAME}".mp4
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

function gi() {
    curl -sLw n https://www.toptal.com/developers/gitignore/api/$@
}

function cuda_is_availabe() {
    python3 -c "import torch; print(torch.cuda.is_available())"
}

start_notebook() {
    echo "Starting background Jupyter notebook server on $(pwd)..."
    tmux new -s "[notebook] $(basename $(pwd))" -d 'jupyter notebook .'
}

start_tensorboard() {
    logdir="$@"
    URL="http://localhost:6006/"
    echo "Starting background TensorBoard server with logs at $logdir"
    tmux set-environment -g logdir $logdir \;             \
        new-session -s "[tensorboard] $(basename $(pwd))" \
        -d 'tensorboard --logdir=$logdir'
    # Wait for tensorboard to come up and open a browser
    echo "Opening tensorboard application on web browser..."
    sleep 2
    gtk-launch $(xdg-settings get default-web-browser) $URL > /dev/null
}

start_notebook_headless() {
    echo "Starting headless background Jupyter notebook server on $(pwd)..."
    tmux new -s "[notebook] $(basename $(pwd))" -d 'jupyter notebook --no-browser --port=8080 .'
}

start_carlzviz () {
    echo "Launching carlaviz in the background"
    tmux new -s "carlaviz" -d '
    docker run -it \
        --network="host" \
        -e carlaviz_host_ip=localhost \
        -e carla_server_ip=localhost \
        -e carla_server_port=2000 \
        mjxu96/carlaviz:0.9.10
    '

    printf "%s" "Waiting for carlaviz to become alive"
    while ! timeout 1 portping -c 1 localhost 8080 &>/dev/null; do
      printf "%c" "."
      sleep 1
    done
    sleep 1
    printf "\n%s\n" "carlaviz is up and running, opening visualizer"
    echo "Run xdg-open http://127.0.0.1:8080/"
}

naqui() {
    tmux new -s "nautilus@$(basename $(pwd))" -d 'nautilus .'
}

jupyter-light-theme() {
    jt -t grade3 -fs 11 -altp -tfs 11 -nfs 11 -cellw 100% -T -vim
}

vim_binary () {
    vim $(which $1)
}

cpp_sources() {
    find . -regextype posix-extended -regex \
        ".*\.(cpp|cxx|cc|hpp|hxx|h)" |
        grep -vE "^./(build)/"
}

filename () {
    BASENAME="$(basename -- $1)"
    FILENAME=${BASENAME%.*}
    echo $FILENAME
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

convert_3ds_to_ply() {
    MODEL="$1"
    BASENAME="$(basename -- $MODEL)"
    FILENAME=${BASENAME%.*}.ply
    echo "Converting $MODEL ${FILENAME}.ply"
    ctmconv $MODEL ${FILENAME}
}

check_includes() {
    grep -rh include | sort | uniq
}
