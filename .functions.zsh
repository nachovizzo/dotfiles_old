get_remote() {
    git remote -vv | tail -n1 | awk '{print $2}' | tr -t '\n' '' | xcopy 
}

