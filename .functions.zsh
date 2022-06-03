function lgrep() { ll | grep $* | fzf }
function hgrep() { history | grep $* | fzf }

to_xclip() {
    echo "Copying $@ to clipboard"
    cat "$@" | xcopy
}

get_remote() {
    git remote -vv | tail -n1 | awk '{print $2}' | tr -d '\n' | xcopy
}

open_remote() {
    xdg-open $(git remote -vv | grep origin | tail -n1 | awk '{print $2}' | xargs -I URL sh -c "echo URL | grep https || echo URL | sed 's/:/\//' | sed 's/^.*@/https:\/\//'") 1> /dev/null
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
    ffmpeg -i "${VIDEO}" -vcodec libx264 -acodec aac ${FILENAME}_wsp.mp4 2>/dev/zero
    mv "${FILENAME}_wsp".mp4 ${VIDEO}
}

cut_video() {
    VIDEO="$1"
    START_TIME="$2"
    END_TIME="$3"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}
    echo "Cutting $VIDEO from ${START_TIME} to ${END_TIME}..."
    ffmpeg -ss ${START_TIME} -to ${END_TIME} -i ${VIDEO} -c copy ${FILENAME}_cut.mp4
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
    echo "Starting background TensorBoard server with logs at $logdir"
    tmux set-environment -g logdir $logdir \;             \
        new-session -s "[tensorboard] $(basename $(pwd))" \
        -d 'tensorboard --logdir=$logdir'
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
        grep -vE "^./(build|3rdparty)/"
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

check_imports() {
    grep -rh import | sort | uniq
}

fast_remove() {
    DIR="$(realpath $1)"
    printf '%s ' "[WARNING] Removing all contents in \"${DIR}\", are you sure (y/n)"
    read REPLY
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    fi
    mkdir /tmp/empty_directory
    rsync -a --delete /tmp/empty_directory/ ${DIR}/
    rm -rf ${DIR}
    rm -rf /tmp/empty_directory
    echo "Done!"
}


latest_file() {
    REGEX="$1"
    find $REGEX -type f -exec ls -1t "{}" + | head -n1 | xargs realpath
}

zip_folder() {
    folder="$1"
    echo "Creating zip file of $folder"
    zip -r $folder.zip $folder
}

load_hydra_completions_python() {
    app="$1"
    echo "Installing tab completions for $app"
    eval "$(python $app -sc install=bash)"
}

unload_hydra_completions_python() {
    app="$1"
    echo "Uninstalling tab completions for $app"
    eval "$(python $app -sc uninstall=bash)"
}

load_hydra_completions() {
    app="$1"
    echo "Installing tab completions for $app"
    eval "$($app -sc install=bash)"
}

unload_hydra_completions() {
    app="$1"
    echo "Uninstalling tab completions for $app"
    eval "$($app -sc uninstall=bash)"
}

function za() {
    zathura --fork $1 2>/dev/null
}

function render_frame_number() {
    # More info: https://ffmpeg.org/ffmpeg-filters.html#drawtext 
    VIDEO="$1"
    TEXT="$2"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}
    echo "Adding $TEXT + frame number to $VIDEO..."
    ffmpeg -i $VIDEO -vf "drawtext=fontfile=Verdana_Bold.ttf: text='${TEXT} #%{frame_num}': start_number=1: x=(w-tw): y=h-(2*lh): fontcolor=black: fontsize=30" -c:a copy ${FILENAME}_fn.mp4
}

function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/"$@" }
